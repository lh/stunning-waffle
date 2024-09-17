import mesa
import numpy as np

# Agent classes
class ConcertGoer(mesa.Agent):
    def __init__(self, unique_id, model):
        super().__init__(unique_id, model)
        self.happiness = 0
        self.bar_visits = 0
        self.bar_cooldown = 0
        self.toilet_cooldown = 0
        self.toilet_need = 0

    def move(self):
        possible_steps = self.model.grid.get_neighborhood(
            self.pos, moore=True, include_center=False
        )
        # Filter out positions with walls
        possible_steps = [pos for pos in possible_steps if not any(isinstance(agent, Wall) for agent in self.model.grid.get_cell_list_contents(pos))]
        
        if possible_steps:
            # Calculate desirability of each position
            desirabilities = []
            for pos in possible_steps:
                desirability = 0
                # Attraction to stage
                stage_distance = self.model.grid.get_distance(pos, self.model.stage.pos)
                desirability += max(0, (self.model.width - stage_distance) / self.model.width * 10 * self.model.stage.desirability)
                
                # Attraction to bar if not on cooldown
                if self.bar_cooldown == 0:
                    for bar in self.model.bars:
                        bar_distance = self.model.grid.get_distance(pos, bar.pos)
                        desirability += max(0, (self.model.width - bar_distance) / self.model.width * 5)
                
                # Attraction to toilet if needed
                if self.toilet_need > 30:
                    for toilet in self.model.toilets:
                        toilet_distance = self.model.grid.get_distance(pos, toilet.pos)
                        desirability += max(0, (self.model.width - toilet_distance) / self.model.width * 15)
                
                # Attraction to exit at end of concert
                if self.model.schedule.steps > self.model.concert_duration * 0.9:
                    for exit in self.model.exits:
                        exit_distance = self.model.grid.get_distance(pos, exit.pos)
                        desirability += max(0, (self.model.width - exit_distance) / self.model.width * 20 * exit.desirability)
                
                desirabilities.append(desirability)
            
            # Choose new position based on desirabilities
            new_position = self.random.choices(possible_steps, weights=desirabilities, k=1)[0]
            self.model.grid.move_agent(self, new_position)

    def step(self):
        self.move()
        self.calculate_happiness()
        self.handle_bar_cooldown()
        self.handle_toilet_need()
        self.interact_with_environment()

    def calculate_happiness(self):
        self.happiness = 0
        # Spacing happiness
        for neighbor in self.model.grid.get_neighbors(self.pos, moore=True, include_center=False, radius=1):
            if isinstance(neighbor, ConcertGoer):
                self.happiness -= 1

        # Stage happiness
        stage = self.model.stage
        distance_to_stage = self.model.grid.get_distance(self.pos, stage.pos)
        self.happiness += max(0, (self.model.width - distance_to_stage) / self.model.width * 10 * stage.desirability)

    def handle_bar_cooldown(self):
        if self.bar_cooldown > 0:
            self.bar_cooldown -= 1
        if self.bar_cooldown == 0 and self.bar_visits > 0:
            self.toilet_need += 1

    def handle_toilet_need(self):
        if self.toilet_need > 0:
            self.toilet_need += 1

    def interact_with_environment(self):
        cellmates = self.model.grid.get_cell_list_contents([self.pos])
        for agent in cellmates:
            if isinstance(agent, Bar) and self.bar_cooldown == 0:
                self.happiness += 10
                self.bar_visits += 1
                self.bar_cooldown = 5
            elif isinstance(agent, Toilet) and self.toilet_need > 30:
                self.happiness += 20
                self.toilet_need = 0
                self.toilet_cooldown = 3
            elif isinstance(agent, Exit) and self.model.schedule.steps > self.model.concert_duration * 0.9:
                self.happiness += 30 * agent.desirability

class Wall(mesa.Agent):
    def __init__(self, unique_id, model):
        super().__init__(unique_id, model)

class Stage(mesa.Agent):
    def __init__(self, unique_id, model):
        super().__init__(unique_id, model)
        self.desirability = 1.0

    def step(self):
        if self.model.schedule.steps > self.model.concert_duration * 0.9:
            self.desirability = max(0.1, self.desirability - 0.1)

class Bar(mesa.Agent):
    def __init__(self, unique_id, model):
        super().__init__(unique_id, model)

class Exit(mesa.Agent):
    def __init__(self, unique_id, model):
        super().__init__(unique_id, model)
        self.desirability = 0.1

    def step(self):
        if self.model.schedule.steps > self.model.concert_duration * 0.9:
            self.desirability = min(1.0, self.desirability + 0.1)

class Toilet(mesa.Agent):
    def __init__(self, unique_id, model):
        super().__init__(unique_id, model)

# ConcertHall model
class ConcertHall(mesa.Model):
    def __init__(self, width, height, num_agents, num_bars, num_exits, num_toilets, concert_duration):
        self.width = width
        self.height = height
        self.num_agents = num_agents
        self.num_bars = num_bars
        self.num_exits = num_exits
        self.num_toilets = num_toilets
        self.concert_duration = concert_duration

        self.grid = mesa.space.MultiGrid(width, height, True)
        self.schedule = mesa.time.RandomActivation(self)

        # Create agents
        self.create_walls()
        self.create_stage()
        self.create_bars()
        self.create_exits()
        self.create_toilets()
        self.create_concert_goers()

        self.running = True

        # Data collection
        self.datacollector = mesa.DataCollector(
            model_reporters={
                "Average Happiness": self.get_average_happiness,
                "Average Bar Visits": self.get_average_bar_visits,
                "Average Toilet Need": self.get_average_toilet_need
            },
            agent_reporters={"Happiness": "happiness", "Bar Visits": "bar_visits", "Toilet Need": "toilet_need"}
        )

    def create_walls(self):
        # Create outer walls
        for x in range(self.width):
            wall_top = Wall(f"wall_top_{x}", self)
            wall_bottom = Wall(f"wall_bottom_{x}", self)
            self.grid.place_agent(wall_top, (x, self.height - 1))
            self.grid.place_agent(wall_bottom, (x, 0))

        for y in range(self.height):
            wall_left = Wall(f"wall_left_{y}", self)
            wall_right = Wall(f"wall_right_{y}", self)
            self.grid.place_agent(wall_left, (0, y))
            self.grid.place_agent(wall_right, (self.width - 1, y))

    def create_stage(self):
        self.stage = Stage("stage", self)
        self.grid.place_agent(self.stage, (self.width // 2, self.height - 2))
        self.schedule.add(self.stage)

    def create_bars(self):
        self.bars = []
        for i in range(self.num_bars):
            bar = Bar(f"bar_{i}", self)
            x = self.random.randrange(1, self.width - 1)
            y = self.random.randrange(1, self.height - 1)
            self.grid.place_agent(bar, (x, y))
            self.bars.append(bar)

    def create_exits(self):
        self.exits = []
        for i in range(self.num_exits):
            exit = Exit(f"exit_{i}", self)
            x = self.random.choice([1, self.width - 2])
            y = self.random.randrange(1, self.height - 1)
            self.grid.place_agent(exit, (x, y))
            self.schedule.add(exit)
            self.exits.append(exit)

    def create_toilets(self):
        self.toilets = []
        for i in range(self.num_toilets):
            toilet = Toilet(f"toilet_{i}", self)
            x = self.random.randrange(1, self.width - 1)
            y = self.random.randrange(1, self.height - 1)
            self.grid.place_agent(toilet, (x, y))
            self.toilets.append(toilet)

    def create_concert_goers(self):
        for i in range(self.num_agents):
            a = ConcertGoer(i, self)
            self.schedule.add(a)
            x = self.random.randrange(1, self.width - 1)
            y = self.random.randrange(1, self.height - 1)
            self.grid.place_agent(a, (x, y))

    def step(self):
        self.schedule.step()
        self.datacollector.collect(self)

    def get_average_happiness(self):
        concert_goers = [agent for agent in self.schedule.agents if isinstance(agent, ConcertGoer)]
        return sum(agent.happiness for agent in concert_goers) / len(concert_goers)

    def get_average_bar_visits(self):
        concert_goers = [agent for agent in self.schedule.agents if isinstance(agent, ConcertGoer)]
        return sum(agent.bar_visits for agent in concert_goers) / len(concert_goers)

    def get_average_toilet_need(self):
        concert_goers = [agent for agent in self.schedule.agents if isinstance(agent, ConcertGoer)]
        return sum(agent.toilet_need for agent in concert_goers) / len(concert_goers)

def agent_portrayal(agent):
    if isinstance(agent, ConcertGoer):
        portrayal = {"Shape": "circle", "Filled": "true", "r": 0.5}
        portrayal["Color"] = "red"
        portrayal["Layer"] = 1
    elif isinstance(agent, Wall):
        portrayal = {"Shape": "rect", "Filled": "true", "w": 1, "h": 1}
        portrayal["Color"] = "black"
        portrayal["Layer"] = 0
    elif isinstance(agent, Stage):
        portrayal = {"Shape": "rect", "Filled": "true", "w": 1, "h": 1}
        portrayal["Color"] = "yellow"
        portrayal["Layer"] = 0
    elif isinstance(agent, Bar):
        portrayal = {"Shape": "rect", "Filled": "true", "w": 1, "h": 1}
        portrayal["Color"] = "blue"
        portrayal["Layer"] = 0
    elif isinstance(agent, Exit):
        portrayal = {"Shape": "rect", "Filled": "true", "w": 1, "h": 1}
        portrayal["Color"] = "green"
        portrayal["Layer"] = 0
    elif isinstance(agent, Toilet):
        portrayal = {"Shape": "rect", "Filled": "true", "w": 1, "h": 1}
        portrayal["Color"] = "purple"
        portrayal["Layer"] = 0
    return portrayal

# Simulation setup and run
model_params = {
    "width": 100,
    "height": 100,
    "num_agents": 200,
    "num_bars": 4,
    "num_exits": 2,
    "num_toilets": 6,
    "concert_duration": 180,  # 3 hours in minutes
}

grid = mesa.visualization.CanvasGrid(agent_portrayal, model_params["width"], model_params["height"], 500, 500)
chart = mesa.visualization.ChartModule([
    {"Label": "Average Happiness", "Color": "Black"},
    {"Label": "Average Bar Visits", "Color": "Blue"},
    {"Label": "Average Toilet Need", "Color": "Red"}
])

server = mesa.visualization.ModularServer(
    ConcertHall, [grid, chart], "Concert Hall Model", model_params
)
server.port = 8521  # The default
server.launch()

# If you want to run the model without visualization, uncomment the following lines:
# model = ConcertHall(**model_params)
# for i in range(model_params["concert_duration"]):
#     model.step()
#
# # Data analysis
# model_data = model.datacollector.get_model_vars_dataframe()
# agent_data = model.datacollector.get_agent_vars_dataframe()
#
# print("Average Happiness over time:")
# print(model_data)
#
# # You can use matplotlib to visualize the data
# import matplotlib.pyplot as plt
# model_data.plot()
# plt.show()
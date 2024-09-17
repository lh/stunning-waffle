import mesa
import numpy as np
import matplotlib.pyplot as plt


# Helper function to calculate Manhattan distance
def manhattan_distance(pos1, pos2):
    return abs(pos1[0] - pos2[0]) + abs(pos1[1] - pos2[1])

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
        possible_steps = [pos for pos in possible_steps if not any(isinstance(agent, Wall) for agent in self.model.grid.get_cell_list_contents(pos))]
        
        if possible_steps:
            desirabilities = []
            for pos in possible_steps:
                desirability = 0
                stage_distance = manhattan_distance(pos, self.model.stage.pos)
                desirability += max(0, (self.model.width - stage_distance) / self.model.width * 10 * self.model.stage.desirability)
                
                if self.bar_cooldown == 0:
                    for bar in self.model.bars:
                        bar_distance = manhattan_distance(pos, bar.pos)
                        desirability += max(0, (self.model.width - bar_distance) / self.model.width * 5)
                
                if self.toilet_need > 30:
                    for toilet in self.model.toilets:
                        toilet_distance = manhattan_distance(pos, toilet.pos)
                        desirability += max(0, (self.model.width - toilet_distance) / self.model.width * 15)
                
                if self.model.schedule.steps > self.model.concert_duration * 0.9:
                    for exit in self.model.exits:
                        exit_distance = manhattan_distance(pos, exit.pos)
                        desirability += max(0, (self.model.width - exit_distance) / self.model.width * 20 * exit.desirability)
                
                desirabilities.append(desirability)
            
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
        for neighbor in self.model.grid.get_neighbors(self.pos, moore=True, include_center=False, radius=1):
            if isinstance(neighbor, ConcertGoer):
                self.happiness -= 1

        stage = self.model.stage
        distance_to_stage = manhattan_distance(self.pos, stage.pos)
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

        self.create_walls()
        self.create_stage()
        self.create_bars()
        self.create_exits()
        self.create_toilets()
        self.create_concert_goers()

        self.running = True

        self.datacollector = mesa.DataCollector(
            model_reporters={
                "Average Happiness": self.get_average_happiness,
                "Average Bar Visits": self.get_average_bar_visits,
                "Average Toilet Need": self.get_average_toilet_need
            },
            agent_reporters={"Happiness": "happiness", "Bar Visits": "bar_visits", "Toilet Need": "toilet_need"}
        )

    def create_walls(self):
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
        portrayal = {"Shape": "circle", "Filled": "true", "r": 0.5, "Color": "red", "Layer": 1}
    elif isinstance(agent, Wall):
        portrayal = {"Shape": "rect", "Filled": "true", "w": 1, "h": 1, "Color": "black", "Layer": 0}
    elif isinstance(agent, Stage):
        portrayal = {"Shape": "rect", "Filled": "true", "w": 1, "h": 1, "Color": "yellow", "Layer": 0}
    elif isinstance(agent, Bar):
        portrayal = {"Shape": "rect", "Filled": "true", "w": 1, "h": 1, "Color": "blue", "Layer": 0}
    elif isinstance(agent, Exit):
        portrayal = {"Shape": "rect", "Filled": "true", "w": 1, "h": 1, "Color": "green", "Layer": 0}
    elif isinstance(agent, Toilet):
        portrayal = {"Shape": "rect", "Filled": "true", "w": 1, "h": 1, "Color": "purple", "Layer": 0}
    return portrayal

def run_simulation(steps):
    model = ConcertHall(**model_params)
    for i in range(steps):
        model.step()
        print(f"Step {i+1}:")
        print(f"  Average Happiness: {model.get_average_happiness():.2f}")
        print(f"  Average Bar Visits: {model.get_average_bar_visits():.2f}")
        print(f"  Average Toilet Need: {model.get_average_toilet_need():.2f}")
        print()

    model_data = model.datacollector.get_model_vars_dataframe()
    agent_data = model.datacollector.get_agent_vars_dataframe()

    print("Final Model Data:")
    print(model_data.tail())

    return model_data, agent_data

# Simulation setup
model_params = {
    "width": 50,
    "height": 50,
    "num_agents": 100,
    "num_bars": 2,
    "num_exits": 2,
    "num_toilets": 3,
    "concert_duration": 180,  # 3 hours in minutes
}

if __name__ == "__main__":
    # Run the simulation
    model_data, agent_data = run_simulation(steps=180)  # Run for 180 steps (3 hours in simulation time)

    # Plot the results
    plt.figure(figsize=(12, 6))
    plt.plot(model_data["Average Happiness"], label="Average Happiness")
    plt.plot(model_data["Average Bar Visits"], label="Average Bar Visits")
    plt.plot(model_data["Average Toilet Need"], label="Average Toilet Need")
    plt.xlabel("Step")
    plt.ylabel("Value")
    plt.title("Concert Hall Simulation Results")
    plt.legend()
    plt.grid(True)
    plt.show()

    # If you want to run the visualization server, uncomment the following lines:
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
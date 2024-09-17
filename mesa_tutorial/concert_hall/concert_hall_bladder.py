import mesa
import numpy as np
import matplotlib.pyplot as plt

def manhattan_distance(pos1, pos2):
    return abs(pos1[0] - pos2[0]) + abs(pos1[1] - pos2[1])

def relu(x):
    return max(0, x)

class ConcertGoer(mesa.Agent):
    def __init__(self, unique_id, model):
        super().__init__(unique_id, model)
        self.happiness = 0
        self.bar_visits = 0
        self.bar_cooldown = 0
        self.toilet_cooldown = 0
        self.toilet_need = 0
        self.last_bar_visit = 0
        self.last_toilet_visit = 0

    def move(self):
        possible_steps = self.model.grid.get_neighborhood(
            self.pos, moore=True, include_center=False
        )
        possible_steps = [pos for pos in possible_steps if not any(isinstance(agent, Wall) for agent in self.model.grid.get_cell_list_contents(pos))]
        
        if possible_steps:
            desirabilities = []
            for pos in possible_steps:
                desirability = 1  # Base desirability
                stage_distance = manhattan_distance(pos, self.model.stage.pos)
                
                # Enhanced stage attraction
                stage_attraction = 20 * self.model.stage.desirability  # Increased base attraction
                distance_factor = max(0, (self.model.width - stage_distance) / self.model.width)
                stage_attraction *= distance_factor ** 0.5  # Slower decay with distance
                
                # Front row bonus
                if stage_distance <= 2:
                    stage_attraction *= 1.5
                
                desirability += stage_attraction
                
                bar_attraction = self.model.schedule.steps / self.model.concert_duration * 10
                if self.bar_cooldown == 0:
                    for bar in self.model.bars:
                        bar_distance = manhattan_distance(pos, bar.pos)
                        desirability += max(0, (self.model.width - bar_distance) / self.model.width * bar_attraction)
                
                toilet_attraction = (self.model.schedule.steps / self.model.concert_duration * 5) * (1 + relu(self.model.schedule.steps - self.last_bar_visit - 10))
                if self.toilet_need > 0:
                    for toilet in self.model.toilets:
                        toilet_distance = manhattan_distance(pos, toilet.pos)
                        desirability += max(0, (self.model.width - toilet_distance) / self.model.width * toilet_attraction)
                
                if self.model.schedule.steps > self.model.concert_duration:
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
        neighbors = self.model.grid.get_neighbors(self.pos, moore=True, include_center=False, radius=1)
        crowd_penalty = sum(1 for neighbor in neighbors if isinstance(neighbor, ConcertGoer))
        
        # Reduce crowding penalty near the stage
        stage_distance = manhattan_distance(self.pos, self.model.stage.pos)
        if stage_distance <= 5:
            crowd_penalty *= 0.5  # Halve the crowding penalty near the stage
        
        self.happiness -= crowd_penalty

        stage = self.model.stage
        distance_to_stage = manhattan_distance(self.pos, stage.pos)
        stage_happiness = max(0, (self.model.width - distance_to_stage) / self.model.width * 20 * stage.desirability)
        
        # Front row bonus for happiness
        if distance_to_stage <= 2:
            stage_happiness *= 1.5
        
        self.happiness += stage_happiness

    def handle_bar_cooldown(self):
        if self.bar_cooldown > 0:
            self.bar_cooldown -= 1

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
                self.last_bar_visit = self.model.schedule.steps
                self.toilet_need += 1
            elif isinstance(agent, Toilet) and self.toilet_need > 0:
                self.happiness += 20
                self.toilet_need = 0
                self.last_toilet_visit = self.model.schedule.steps
            elif isinstance(agent, Exit) and self.model.schedule.steps > self.model.concert_duration:
                self.happiness += 30 * agent.desirability

class Wall(mesa.Agent):
    def __init__(self, unique_id, model):
        super().__init__(unique_id, model)

class Stage(mesa.Agent):
    def __init__(self, unique_id, model):
        super().__init__(unique_id, model)
        self.desirability = 1.0

    def step(self):
        if self.model.schedule.steps > self.model.concert_duration:
            self.desirability = 0

class Bar(mesa.Agent):
    def __init__(self, unique_id, model):
        super().__init__(unique_id, model)

class Exit(mesa.Agent):
    def __init__(self, unique_id, model):
        super().__init__(unique_id, model)
        self.desirability = 0.1

    def step(self):
        if self.model.schedule.steps > self.model.concert_duration:
            self.desirability = min(1.0, self.desirability + 0.1)

class Toilet(mesa.Agent):
    def __init__(self, unique_id, model):
        super().__init__(unique_id, model)

class ConcertHall(mesa.Model):
    def __init__(self, width, height, num_agents):
        super().__init__()
        self.width = width
        self.height = height
        self.num_agents = num_agents
        self.concert_duration = 140  # Concert ends at 140 minutes

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
                "Average Toilet Need": self.get_average_toilet_need,
                "Stage Crowding": self.get_stage_crowding
            },
            agent_reporters={"Happiness": "happiness", "Bar Visits": "bar_visits", "Toilet Need": "toilet_need"}
        )

    def create_stage(self):
        self.stage = Stage("stage", self)
        stage_start = (self.width // 2) - 5
        stage_positions = [(x, self.height - 2) for x in range(stage_start, stage_start + 10)]
        self.grid.place_agent(self.stage, stage_positions[0])
        for pos in stage_positions[1:]:
            self.grid.place_agent(self.stage, pos)
        self.schedule.add(self.stage)

    def create_bars(self):
        self.bars = [Bar("bar_left", self)]
        bar_y = self.height // 2
        for y in range(bar_y - 2, bar_y + 3):
            self.grid.place_agent(self.bars[0], (1, y))

    def create_exits(self):
        self.exits = [Exit("exit_left", self), Exit("exit_right", self)]
        exit_left_start = 5
        exit_right_start = self.width - 15
        for x in range(10):
            self.grid.place_agent(self.exits[0], (exit_left_start + x, 0))
            self.grid.place_agent(self.exits[1], (exit_right_start + x, 0))
        self.schedule.add(self.exits[0])
        self.schedule.add(self.exits[1])

    def create_toilets(self):
        self.toilets = [Toilet("toilet_right", self)]
        toilet_y = self.height // 2
        for y in range(toilet_y - 2, toilet_y + 3):
            self.grid.place_agent(self.toilets[0], (self.width - 2, y))

    def create_concert_goers(self):
        for i in range(self.num_agents):
            a = ConcertGoer(i, self)
            self.schedule.add(a)
            x = self.random.randrange(1, self.width - 1)
            y = self.random.randrange(1, self.height - 1)
            self.grid.place_agent(a, (x, y))

    def create_walls(self):
        for y in range(self.height):
            wall_left = Wall(f"wall_left_{y}", self)
            wall_right = Wall(f"wall_right_{y}", self)
            self.grid.place_agent(wall_left, (0, y))
            self.grid.place_agent(wall_right, (self.width - 1, y))

        for x in range(self.width):
            wall_top = Wall(f"wall_top_{x}", self)
            self.grid.place_agent(wall_top, (x, self.height - 1))

    def step(self):
        self.schedule.step()
        self.datacollector.collect(self)
        self.remove_exited_agents()

    def remove_exited_agents(self):
        to_remove = []
        for agent in self.schedule.agents:
            if isinstance(agent, ConcertGoer) and agent.pos[1] < 0:
                to_remove.append(agent)
        for agent in to_remove:
            self.grid.remove_agent(agent)
            self.schedule.remove(agent)

    def get_average_happiness(self):
        concert_goers = [agent for agent in self.schedule.agents if isinstance(agent, ConcertGoer)]
        return sum(agent.happiness for agent in concert_goers) / len(concert_goers) if concert_goers else 0

    def get_average_bar_visits(self):
        concert_goers = [agent for agent in self.schedule.agents if isinstance(agent, ConcertGoer)]
        return sum(agent.bar_visits for agent in concert_goers) / len(concert_goers) if concert_goers else 0

    def get_average_toilet_need(self):
        concert_goers = [agent for agent in self.schedule.agents if isinstance(agent, ConcertGoer)]
        return sum(agent.toilet_need for agent in concert_goers) / len(concert_goers) if concert_goers else 0
    
    def get_stage_crowding(self):
        stage_area = [(x, y) for x in range(self.width) for y in range(self.height) if manhattan_distance((x, y), self.stage.pos) <= 5]
        crowd_count = sum(1 for pos in stage_area for agent in self.grid.get_cell_list_contents(pos) if isinstance(agent, ConcertGoer))
        return crowd_count / len(stage_area)


model_params = {
    "width": 30,
    "height": 92,
    "num_agents": 100
}

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
        print(f"  Stage Crowding: {model.get_stage_crowding():.2f}")
        print(f"  Remaining Agents: {len([agent for agent in model.schedule.agents if isinstance(agent, ConcertGoer)])}")
        print()

    model_data = model.datacollector.get_model_vars_dataframe()
    agent_data = model.datacollector.get_agent_vars_dataframe()

    print("Final Model Data:")
    print(model_data.tail())

    return model_data, agent_data

if __name__ == "__main__":
    model_data, agent_data = run_simulation(steps=240)  # Run for 4 hours in simulation time

    plt.figure(figsize=(12, 6))
    plt.plot(model_data["Average Happiness"], label="Average Happiness")
    plt.plot(model_data["Average Bar Visits"], label="Average Bar Visits")
    plt.plot(model_data["Average Toilet Need"], label="Average Toilet Need")
    plt.plot(model_data["Stage Crowding"], label="Stage Crowding")
    plt.xlabel("Step")
    plt.ylabel("Value")
    plt.title("Concert Hall Simulation Results")
    plt.legend()
    plt.grid(True)
    plt.show()

    grid = mesa.visualization.CanvasGrid(agent_portrayal, model_params["width"], model_params["height"], 15 * model_params["width"], 15 * model_params["height"])
    chart = mesa.visualization.ChartModule([
        {"Label": "Average Happiness", "Color": "Black"},
        {"Label": "Average Bar Visits", "Color": "Blue"},
        {"Label": "Average Toilet Need", "Color": "Red"}
    ])
    server = mesa.visualization.ModularServer(
        ConcertHall, [grid, chart], "Concert Hall Model", model_params
    )
    server.port = 8521
    server.launch()
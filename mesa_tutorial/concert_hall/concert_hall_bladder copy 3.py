import mesa
import numpy as np
import matplotlib.pyplot as plt
import logging

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
                
                # Stage attraction (now applies to all agents)
                stage_distance = manhattan_distance(pos, self.model.stage.pos)
                stage_attraction = 30 * self.model.stage.desirability  # Increased stage attraction
                distance_factor = max(0, (self.model.width - stage_distance) / self.model.width)
                stage_attraction *= distance_factor ** 0.5
                desirability += stage_attraction
                
                # Bar attraction
                bar_attraction = self.model.schedule.steps / self.model.concert_duration * 20  # Increased bar attraction
                if self.bar_cooldown == 0:
                    for bar in self.model.bars:
                        bar_distance = manhattan_distance(pos, bar.pos)
                        desirability += max(0, (self.model.width - bar_distance) / self.model.width * bar_attraction)
                
                # Toilet attraction
                toilet_attraction = self.toilet_need * 10  # Make toilet attraction proportional to need
                if self.toilet_need > 0:
                    for toilet in self.model.toilets:
                        toilet_distance = manhattan_distance(pos, toilet.pos)
                        desirability += max(0, (self.model.width - toilet_distance) / self.model.width * toilet_attraction)
                
                # Exit attraction
                if self.model.schedule.steps > self.model.concert_duration:
                    for exit in self.model.exits:
                        exit_distance = manhattan_distance(pos, exit.pos)
                        desirability += max(0, (self.model.width - exit_distance) / self.model.width * 30 * exit.desirability)
                
                desirabilities.append(desirability)
            
            new_position = self.random.choices(possible_steps, weights=desirabilities, k=1)[0]
            self.model.grid.move_agent(self, new_position)
            
            # Log the move
            logging.info(f"Step {self.model.schedule.steps}: Agent moved to {new_position}. Desirabilities: {desirabilities}")

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
        self.toilet_need += 0.1  # Increase toilet need over time

    def interact_with_environment(self):
        cellmates = self.model.grid.get_cell_list_contents([self.pos])
        for agent in cellmates:
            if isinstance(agent, Bar) and self.bar_cooldown == 0:
                self.happiness += 10
                self.bar_visits += 1
                self.bar_cooldown = 10  # Increased cooldown
                self.last_bar_visit = self.model.schedule.steps
                self.toilet_need += 2  # Increased toilet need after bar visit
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

    def create_walls(self):
        # Create top and bottom walls
        for x in range(self.width):
            wall_top = Wall(f"wall_top_{x}", self)
            wall_bottom = Wall(f"wall_bottom_{x}", self)
            self.grid.place_agent(wall_top, (x, self.height - 1))
            self.grid.place_agent(wall_bottom, (x, 0))

        # Create left and right walls
        for y in range(self.height):
            wall_left = Wall(f"wall_left_{y}", self)
            wall_right = Wall(f"wall_right_{y}", self)
            self.grid.place_agent(wall_left, (0, y))
            self.grid.place_agent(wall_right, (self.width - 1, y))

    def create_stage(self):
        self.stage = Stage("stage", self)
        stage_start = self.height // 2 - 5  # Center the 10-unit high stage
        for y in range(stage_start, stage_start + 10):
            self.grid.place_agent(self.stage, (1, y))  # Place stage on the left wall


    def create_bars(self):
        self.bars = [Bar("bar_bottom", self)]
        bar_x = self.width // 2
        self.grid.place_agent(self.bars[0], (bar_x, 1))  # Place bar at a single position


    def create_exits(self):
        self.exits = [Exit("exit_top", self), Exit("exit_bottom", self)]
        exit_top_start = self.height - 15
        exit_bottom_start = 5
        self.grid.place_agent(self.exits[0], (self.width - 2, exit_top_start))
        self.grid.place_agent(self.exits[1], (self.width - 2, exit_bottom_start))
        self.schedule.add(self.exits[0])
        self.schedule.add(self.exits[1])

    def create_toilets(self):
        self.toilets = [Toilet("toilet_top", self)]
        toilet_x = self.width // 2
        self.grid.place_agent(self.toilets[0], (toilet_x, self.height - 2))

    def create_concert_goers(self):
        a = ConcertGoer(0, self)
        self.schedule.add(a)
        x = self.random.randrange(2, self.width - 2)  # Avoid placing agents on the walls
        y = self.random.randrange(2, self.height - 2)
        self.grid.place_agent(a, (x, y))
        logging.info(f"Agent created at position {(x, y)}")

    def step(self):
        self.schedule.step()
        self.datacollector.collect(self)
        self.remove_exited_agents()

    def remove_exited_agents(self):
        to_remove = []
        for agent in self.schedule.agents:
            if isinstance(agent, ConcertGoer) and agent.pos[0] >= self.width - 2:  # Check if agent has reached the exit
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
        stage_area = [(x, y) for x in range(1, 8) for y in range(self.height) if manhattan_distance((x, y), self.stage.pos) <= 5]
        crowd_count = sum(1 for pos in stage_area for agent in self.grid.get_cell_list_contents(pos) if isinstance(agent, ConcertGoer))
        return crowd_count / len(stage_area)

model_params = {
    "width": 92,  # Swapped width and height
    "height": 30,
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

def run_single_agent_simulation(steps):
    logging.basicConfig(level=logging.INFO, format='%(message)s')
    model = ConcertHall(**model_params)
    
    for i in range(steps):
        model.step()
        concert_goers = [agent for agent in model.schedule.agents if isinstance(agent, ConcertGoer)]
        if concert_goers:
            agent = concert_goers[0]  # Get the single ConcertGoer agent
            print(f"Step {i+1}:")
            print(f"  Agent Position: {agent.pos}")
            print(f"  Happiness: {agent.happiness:.2f}")
            print(f"  Bar Visits: {agent.bar_visits}")
            print(f"  Toilet Need: {agent.toilet_need}")
            print(f"  Bar Cooldown: {agent.bar_cooldown}")
            print(f"  Toilet Cooldown: {agent.toilet_cooldown}")
            print()
        else:
            print(f"Step {i+1}: No ConcertGoer agents found.")
            break

    model_data = model.datacollector.get_model_vars_dataframe()
    agent_data = model.datacollector.get_agent_vars_dataframe()

    print("Final Model Data:")
    print(model_data.tail())

    return model_data, agent_data

if __name__ == "__main__":
    model_params = {
        "width": 92,
        "height": 30,
        "num_agents": 1  # Changed to 1 for single agent simulation
    }
    
    model_data, agent_data = run_single_agent_simulation(steps=50)  # Run for 50 steps

    plt.figure(figsize=(12, 6))
    plt.plot(model_data["Average Happiness"], label="Happiness")
    plt.plot(model_data["Average Bar Visits"], label="Bar Visits")
    plt.plot(model_data["Average Toilet Need"], label="Toilet Need")
    plt.xlabel("Step")
    plt.ylabel("Value")
    plt.title("Single Agent Concert Hall Simulation Results")
    plt.legend()
    plt.grid(True)
    plt.show()
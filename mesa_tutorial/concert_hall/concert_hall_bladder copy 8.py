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
        self.bar_desire = 0
        self.toilet_desire_score = 0
        self.distance_from_stage_score = 0
        self.random_move_chance = 0.05  # Reduced from 0.1 to 0.05 (5% chance of random movement)
        
    def move(self):
        possible_steps = self.model.grid.get_neighborhood(
            self.pos, moore=True, include_center=False
        )
        possible_steps = [pos for pos in possible_steps if not any(isinstance(agent, Wall) for agent in self.model.grid.get_cell_list_contents(pos))]

        if possible_steps:
            if self.random.random() < self.random_move_chance:
                # Make a random move
                new_position = self.random.choice(possible_steps)
                logging.info(f"Step {self.model.schedule.steps}: Agent made a random move to {new_position}")
            else:
                # Choose the position with the highest desirability
                desirabilities = []
                for pos in possible_steps:
                    desirability = self.calculate_position_desirability(pos)
                    desirabilities.append((pos, desirability))
                
                # Sort positions by desirability in descending order
                desirabilities.sort(key=lambda x: x[1], reverse=True)
                
                # Choose the position with the highest desirability
                new_position = desirabilities[0][0]
                logging.info(f"Step {self.model.schedule.steps}: Agent moved to {new_position}. Desirabilities: {desirabilities}")
            
            self.model.grid.move_agent(self, new_position)

    def calculate_position_desirability(self, pos):
        desirability = 1  # Base desirability
        
        # Stage attraction (increased weight)
        stage_distance = manhattan_distance(pos, self.model.stage.pos)
        stage_attraction = 50 * self.model.stage.desirability  # Increased from 30 to 50
        distance_factor = max(0, (self.model.width - stage_distance) / self.model.width)
        stage_attraction *= distance_factor ** 0.3  # Changed from 0.5 to 0.3 to make distance less punishing
        desirability += stage_attraction
        
        # Bar attraction (slightly reduced)
        if self.bar_cooldown == 0:
            for bar in self.model.bars:
                bar_distance = manhattan_distance(pos, bar.pos)
                desirability += max(0, (self.model.width - bar_distance) / self.model.width * self.bar_desire * 0.8)  # Reduced by 20%
        
        # Toilet attraction (slightly reduced)
        toilet_attraction = self.toilet_need * 8  # Reduced from 10 to 8
        if self.toilet_need > 0:
            for toilet in self.model.toilets:
                toilet_distance = manhattan_distance(pos, toilet.pos)
                desirability += max(0, (self.model.width - toilet_distance) / self.model.width * toilet_attraction)
        
        # Exit attraction (unchanged)
        if self.model.schedule.steps > self.model.concert_duration:
            for exit in self.model.exits:
                exit_distance = manhattan_distance(pos, exit.pos)
                desirability += max(0, (self.model.width - exit_distance) / self.model.width * 30 * exit.desirability)
        
        return desirability

    def calculate_happiness(self):
        # Base happiness
        self.happiness = 50

        # Happiness from stage proximity
        stage_distance = manhattan_distance(self.pos, self.model.stage.pos)
        stage_happiness = max(0, (self.model.width - stage_distance) / self.model.width * 30)
        self.happiness += stage_happiness

        # Penalty for high bar desire
        bar_desire_penalty = self.bar_desire * 0.2
        self.happiness -= bar_desire_penalty

        # Penalty for high toilet need
        toilet_need_penalty = self.toilet_need * 0.5
        self.happiness -= toilet_need_penalty

        # Bonus for recent bar visit
        time_since_bar_visit = self.model.schedule.steps - self.last_bar_visit
        if time_since_bar_visit < 10:
            self.happiness += 10 * (1 - time_since_bar_visit / 10)

        # Penalty for crowding
        neighbors = self.model.grid.get_neighbors(self.pos, moore=True, include_center=False, radius=1)
        crowd_penalty = sum(1 for neighbor in neighbors if isinstance(neighbor, ConcertGoer))
        self.happiness -= crowd_penalty * 2

        # Ensure happiness is between 0 and 100
        self.happiness = max(0, min(100, self.happiness))




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
            agent_reporters={
                "Happiness": "happiness",
                "Bar Visits": "bar_visits",
                "Toilet Need": "toilet_need",
                "Bar Desire": "bar_desire",
                "Position": "pos"
            }
        )

    def create_stage(self):
        self.stage = Stage("stage", self)
        stage_start = self.height // 2 - 5  # Center the 10-unit high stage
        for y in range(stage_start, stage_start + 10):
            self.grid.place_agent(self.stage, (1, y))  # Place stage on the left wall
        self.schedule.add(self.stage)

    def create_walls(self):
        # Create top and bottom walls
        for x in range(self.width):
            wall_top = Wall(f"wall_top_{x}", self)
            wall_bottom = Wall(f"wall_bottom_{x}", self)
            self.grid.place_agent(wall_top, (x, self.height - 1))
            self.grid.place_agent(wall_bottom, (x, 0))


    def create_concert_goers(self):
        for i in range(self.num_agents):
            a = ConcertGoer(i, self)
            self.schedule.add(a)
            x = self.random.randrange(2, self.width - 2)  # Avoid placing agents on the walls
            y = self.random.randrange(2, self.height - 2)
            self.grid.place_agent(a, (x, y))
            logging.info(f"Agent {i} created at position {(x, y)}")

    def step(self):
        self.schedule.step()
        self.datacollector.collect(self)
        if self.schedule.steps % 10 == 0:  # Log every 10 steps
            self.log_agent_positions()

    def log_agent_positions(self):
        for agent in self.schedule.agents:
            if isinstance(agent, ConcertGoer):
                logging.info(f"Step {self.schedule.steps}: Agent {agent.unique_id} at position {agent.pos}")


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
        return {"Shape": "circle", "Filled": "true", "r": 0.5, "Color": "red", "Layer": 1}
    elif isinstance(agent, Wall):
        return {"Shape": "rect", "Filled": "true", "w": 1, "h": 1, "Color": "black", "Layer": 0}
    elif isinstance(agent, Stage):
        return {"Shape": "rect", "Filled": "true", "w": 1, "h": 1, "Color": "yellow", "Layer": 0}
    elif isinstance(agent, Bar):
        return {"Shape": "rect", "Filled": "true", "w": 1, "h": 1, "Color": "blue", "Layer": 0}
    elif isinstance(agent, Exit):
        return {"Shape": "rect", "Filled": "true", "w": 1, "h": 1, "Color": "green", "Layer": 0}
    elif isinstance(agent, Toilet):
        return {"Shape": "rect", "Filled": "true", "w": 1, "h": 1, "Color": "purple", "Layer": 0}


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
    logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(message)s')
    
    model_params = {
        "width": 92,
        "height": 30,
        "num_agents": 5  # Increased from 1 to 5 for better visualization
    }
    
    # Set up the grid visualization
    grid = mesa.visualization.CanvasGrid(agent_portrayal, model_params["width"], model_params["height"], 920, 300)
    
    # Set up charts for various metrics
    happiness_chart = mesa.visualization.ChartModule([
        {"Label": "Average Happiness", "Color": "Black"},
    ])
    
    bar_visits_chart = mesa.visualization.ChartModule([
        {"Label": "Average Bar Visits", "Color": "Blue"},
    ])
    
    toilet_need_chart = mesa.visualization.ChartModule([
        {"Label": "Average Toilet Need", "Color": "Red"},
    ])
    
    # Create and launch the server
    server = mesa.visualization.ModularServer(
        ConcertHall,
        [grid, happiness_chart, bar_visits_chart, toilet_need_chart],
        "Concert Hall Model",
        model_params
    )
    server.port = 8521  # The default port, you can change it if needed
    server.launch()
import mesa
import numpy as np



def manhattan_distance(pos1, pos2):
    return abs(pos1[0] - pos2[0]) + abs(pos1[1] - pos2[1])

class ConcertGoer(mesa.Agent):
    def __init__(self, unique_id, model):
        super().__init__(unique_id, model)
        self.happiness = 0
        self.bar_visits = 0
        self.bar_cooldown = 0
        self.toilet_need = 0
        self.last_bar_visit = 0
        self.last_toilet_visit = 0
        self.toilet_cooldown = 0
        
    def move(self):
        possible_steps = self.model.grid.get_neighborhood(
            self.pos, moore=True, include_center=False
        )
        possible_steps = [pos for pos in possible_steps if not any(isinstance(agent, Wall) for agent in self.model.grid.get_cell_list_contents(pos))]
        
        if possible_steps:
            desirabilities = []
            for pos in possible_steps:
                desirability = self.calculate_position_desirability(pos)
                desirabilities.append((pos, desirability))
            
            desirabilities.sort(key=lambda x: x[1], reverse=True)
            new_position = desirabilities[0][0]
            self.model.grid.move_agent(self, new_position)

    def step(self):
        self.move()
        self.calculate_happiness()
        self.handle_bar_cooldown()
        self.handle_toilet_need()
        self.interact_with_environment()

    def calculate_position_desirability(self, pos):
        desirability = 1
        stage_distance = manhattan_distance(pos, self.model.stage.pos)
        
        # Increase the stage attraction multiplier to make the stage more attractive
        stage_attraction = 50 * self.model.stage.desirability * self.model.music_quality # Increased from 30 to 50
        distance_factor = max(0, (self.model.width - stage_distance) / self.model.width)
        stage_attraction *= distance_factor ** 0.5
        desirability += stage_attraction

        if self.bar_cooldown == 0:
            for bar in self.model.bars:
                bar_distance = manhattan_distance(pos, bar.pos)
                desirability += max(0, (self.model.width - bar_distance) / self.model.width * 20)

        # Add penalty for proximity to other agents
        for agent in self.model.schedule.agents:
            if agent != self:
                agent_distance = manhattan_distance(pos, agent.pos)
                if agent_distance <= 2:
                    penalty = (2 - agent_distance) / 2 * 10  # Penalty proportional to distance
                    desirability -= penalty

        return desirability

    def calculate_happiness(self):
        self.happiness = 0
        neighbors = self.model.grid.get_neighbors(self.pos, moore=True, include_center=False, radius=1)
        crowd_penalty = sum(1 for neighbor in neighbors if isinstance(neighbor, ConcertGoer))
        
        stage_distance = manhattan_distance(self.pos, self.model.stage.pos)
        if stage_distance <= 5:
            crowd_penalty *= 0.5
        
        self.happiness -= crowd_penalty

        stage = self.model.stage
        distance_to_stage = manhattan_distance(self.pos, stage.pos)
        stage_happiness = max(0, (self.model.width - distance_to_stage) / self.model.width * 20 * stage.desirability)
        
        if distance_to_stage <= 2:
            stage_happiness *= 1.5
        
        self.happiness += stage_happiness
        
    def handle_bar_cooldown(self):
        if self.bar_cooldown > 0:
            self.bar_cooldown -= 1

    def handle_toilet_need(self):
        self.toilet_need += 0.1

    def interact_with_environment(self):
        cellmates = self.model.grid.get_cell_list_contents([self.pos])
        for agent in cellmates:
            if isinstance(agent, Bar) and self.bar_cooldown == 0:
                self.happiness += 10
                self.bar_visits += 1
                self.bar_cooldown = 10
                self.last_bar_visit = self.model.schedule.steps
                self.toilet_need += 2
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
    def __init__(self, width, height, num_agents, music_quality):
        super().__init__()
        self.width = width
        self.height = height
        self.num_agents = num_agents
        self.music_quality = music_quality  # Store the music_quality parameter
        self.concert_duration = 140

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
        stage_start = self.height // 2 - 5
        for y in range(stage_start, stage_start + 10):
            self.grid.place_agent(self.stage, (1, y))

    def create_bars(self):
        self.bars = [Bar("bar_bottom", self)]
        bar_x = self.width // 2
        self.grid.place_agent(self.bars[0], (bar_x, 1))

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
        for i in range(self.num_agents):
            a = ConcertGoer(i, self)
            self.schedule.add(a)
            x = self.random.randrange(2, self.width - 2)
            y = self.random.randrange(2, self.height - 2)
            self.grid.place_agent(a, (x, y))

    def step(self):
        self.schedule.step()
        self.datacollector.collect(self)
        self.remove_exited_agents()

    def remove_exited_agents(self):
        to_remove = [agent for agent in self.schedule.agents if isinstance(agent, ConcertGoer) and agent.pos[0] >= self.width - 2]
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
    
def agent_portrayal(agent):
    if isinstance(agent, ConcertGoer):
        happiness = max(0, min(1, agent.happiness / 100))  # Normalize happiness to 0-1
        r = max(0, min(255, int(255 * (1 - happiness))))
        g = max(0, min(255, int(255 * happiness)))
        b = 0
        color = f"rgb({r},{g},{b})"
        return {"Shape": "circle", "Color": color, "Filled": "true", "r": 0.8, "Layer": 1}
    elif isinstance(agent, Wall):
        return {"Shape": "rect", "Color": "black", "Filled": "true", "w": 1, "h": 1, "Layer": 0}
    elif isinstance(agent, Stage):
        return {"Shape": "rect", "Color": "yellow", "Filled": "true", "w": 1, "h": 1, "Layer": 0}
    elif isinstance(agent, Bar):
        return {"Shape": "rect", "Color": "blue", "Filled": "true", "w": 1, "h": 1, "Layer": 0}
    elif isinstance(agent, Exit):
        return {"Shape": "rect", "Color": "green", "Filled": "true", "w": 1, "h": 1, "Layer": 0}
    elif isinstance(agent, Toilet):
        return {"Shape": "rect", "Color": "purple", "Filled": "true", "w": 1, "h": 1, "Layer": 0}
    return {}
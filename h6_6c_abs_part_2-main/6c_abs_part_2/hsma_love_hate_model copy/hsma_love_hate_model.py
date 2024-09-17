import mesa

from mesa import Agent, Model
from mesa.time import RandomActivation
from mesa.space import MultiGrid
from mesa.datacollection import DataCollector

import random

class HSMA_Agent(Agent):
    def __init__(self, unique_id, model, initial_love_prob, persuasiveness_max):
        super().__init__(unique_id, model)
        self.love_score = random.uniform(0, 1)  # Continuous score between 0 and 1
        self.persuasiveness = random.uniform(0.0, persuasiveness_max)
        
    def move(self):
        possible_steps = self.model.grid.get_neighborhood(
                self.pos, moore=True, include_center=False)
        new_position = random.choice(possible_steps)
        self.model.grid.move_agent(self, new_position)

    def talk(self):
        cellmates = self.model.grid.get_cell_list_contents([self.pos])
        if len(cellmates) > 1:
            for inhabitant in cellmates:
                if inhabitant != self:
                    self.influence_score(inhabitant)

    def influence_score(self, other_agent):
        score_diff = self.love_score - other_agent.love_score
        influence = self.persuasiveness * score_diff
        other_agent.love_score = max(0, min(1, other_agent.love_score + influence))

    def step(self):
        if random.choice([True, False]):
            self.move()
        self.talk()

class Persuasion_Model(Model):
    def __init__(self, N, width, height, initial_love_prob, persuasiveness_max):
        self.running = True
        self.num_agents = N
        self.grid = MultiGrid(width, height, True)
        self.schedule = RandomActivation(self)

        for i in range(self.num_agents):
            a = HSMA_Agent(i, self, initial_love_prob, persuasiveness_max)
            self.schedule.add(a)
            try:
                start_cell = self.grid.find_empty()
                self.grid.place_agent(a, start_cell)
            except:
                x = random.randrange(self.grid.width)
                y = random.randrange(self.grid.height)
                self.grid.place_agent(a, (x,y))

        self.datacollector = DataCollector(
            model_reporters={"Average Love Score": calculate_average_love_score},
            agent_reporters={"Love Score": "love_score"}
        )

    def step(self):
        self.datacollector.collect(self)
        self.schedule.step()

def calculate_average_love_score(model):
    love_scores = [agent.love_score for agent in model.schedule.agents]
    return sum(love_scores) / len(love_scores)
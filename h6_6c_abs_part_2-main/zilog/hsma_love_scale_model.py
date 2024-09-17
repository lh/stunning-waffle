from mesa import Agent, Model
from mesa.time import RandomActivation # random order of agent actions
from mesa.space import MultiGrid # multiple agents per cell
from mesa.datacollection import DataCollector

import random

# A class representing a 'HSMA' agent.  Note we're passing in the Agent class
# we imported from the mesa library.  Remember that this means our class here
# is inheriting from the 'parent' Agent class, and our class is the 'child',
# which inherits all the attributes and methods of the parent, but may have
# some of its own.
class HSMA_Agent(Agent):
    # Constructor
    def __init__(self, unique_id, model, prob_move):
        # Call the constructor from the parent Agent class, which will do all
        # the hard work of defining what an agent is - we just give it an ID
        # and a model that it will live in
        super().__init__(unique_id, model)

        # Randomly determine the agent's initial love of HSMA score
        self.love_score = random.uniform(0, 1)

        # Set the agent's default persuasiveness to 0.2
        self.persuasiveness = 0.2

        # Set the agent's probability of moving at any time step
        self.prob_move = prob_move
        
    # Agent movement method - this is called if it is determined the agent
    # is going to move on this time step
    def move(self):
        # Get a list of possible neighbouring cells to which to move
        # We use the get_neighborhood function, giving it the agent's current
        # position on the grid, stating we want a Moore neighbourhood (which
        # includes diagonals), and that we don't want to include the centre
        # (where the agent is currently) in the returned neighbourhood list
        possible_steps = self.model.grid.get_neighborhood(
                self.pos, moore=True, include_center=False)
            
        # Select new position at random
        new_position = random.choice(possible_steps)
            
        # Move the agent to the randomly selected new position
        self.model.grid.move_agent(self, new_position)

    # Method to talk to other HSMAs (if there are any around) and potentially 
    # influence the opinion of other agents if there are other agents in the 
    # same cell
    def talk(self):
        # Get list of agents in this cell.  We use the get_cell_list_contents
        # function of the grid object and pass it our current position
        cellmates = self.model.grid.get_cell_list_contents([self.pos])

        # Check if there are other agents here - if the list of cellmates is
        # greater than 1 then there must be more here than this agent
        if len(cellmates) > 1:
            # for each agent in the cell
            for inhabitant in cellmates:
                # Determine current persuasiveness of our agent (the one that's
                # acting here), with stronger emotions leading to a higher
                # persuasiveness
                if self.love_score < 0.1 or self.love_score > 0.9:
                    self.persuasiveness = 1
                elif self.love_score < 0.2 or self.love_score > 0.8:
                    self.persuasiveness = 0.8
                elif self.love_score < 0.3 or self.love_score > 0.7:
                    self.persuasiveness = 0.6
                elif self.love_score < 0.4 or self.love_score > 0.6:
                    self.persuasiveness = 0.4
                else:
                    self.persuasiveness = 0.2

                # Determine current love score of the other agent, and move
                # their score closer to our agent (and do this more 
                # significantly the higher our agent's persuasiveness)
                other_agent_score = inhabitant.love_score

                # If the other agent has a higher score, bring them down closer
                # to our agent.  If they have a lower score, bring them up
                # closer to our agent.  If they have the same score, do nothing.
                if other_agent_score > self.love_score:
                    difference_in_scores = other_agent_score - self.love_score

                    inhabitant.love_score -= (self.persuasiveness *
                                              difference_in_scores)
                elif other_agent_score < self.love_score:
                    difference_in_scores = self.love_score - other_agent_score

                    inhabitant.love_score += (self.persuasiveness *
                                              difference_in_scores)
                else:
                    # Do nothing
                    pass

    # Step method - this defines which of the agent's actions will be taken
    # on a time step, and in which order
    def step(self):
        # Randomly decide whether the agent should move on this time step, based
        # on the agent's probability of moving
        if random.uniform(0, 1) < self.prob_move:
            self.move()

        # Regardless of whether or not the agent moved, it should begin its
        # talking behaviour for this time step
        self.talk()

# Class representing our ABS model
class Persuasion_Model(Model):
    # 2D Model initialisation constructor - initialise with N agents, and 
    # specified width and height.  Also pass in the things we need to pass
    # to our agents when instantiating them.
    def __init__(self, N, width, height, prob_move):
        self.running = True # this code is required for BatchRunner
        self.num_agents = N

        # Set up a Toroidal multi-grid (Toroidal = if the agent is in a cell
        # on the border of the grid, and moves towards the border, they'll
        # come out the other side.  Think PacMan :) The True Boolean passed in
        # switches that on.  Multi-Grid just means we can have more than one 
        # agent per cell)
        self.grid = MultiGrid(width, height, True)

        # Set up a scheduler with random order of agents being activated 
        # each turn.  A random activation is probably the best in most cases,
        # unless you have information that certain agents will act before
        # certain other agents
        self.schedule = RandomActivation(self)

        # Create HSMA agents up to the number specified
        for i in range(self.num_agents):
            # Create agent with ID taken from for loop - we pass in the i
            # value as the unique_id, self (the model here) as the model, and 
            # then the various parameter values we specified
            a = HSMA_Agent(i, self, prob_move)
            
            # Add the agent to the scheduler
            self.schedule.add(a)

            # Try adding the agent to a random empty cell
            try:
                start_cell = self.grid.find_empty()
                self.grid.place_agent(a, start_cell)
            # If you can't find an empty cell, just pick any cell at random
            except:
                x = random.randrange(self.grid.width)
                y = random.randrange(self.grid.height)
                self.grid.place_agent(a, (x,y))

        # We set up a DataCollector that can collect agent-specific and
        # model-wide data.  Here, we tell it to collect data on the total number
        # of agents loving and hating HSMA, which it calculates by calling the
        # functions we name here (we write them further down).
        # We don't use any agent reporters here, but we could if we wanted to
        # track an attribute of agents over time
        self.datacollector = DataCollector(
            model_reporters={"Mean Love Score":calculate_mean_love_score},
            agent_reporters={}
        )

    # Function to advance the model by one step (we just tell the scheduler to
    # step forward one time step)
    def step(self):
        # Tell the data collector to collect the data for this time step
        self.datacollector.collect(self)
        
        # Ask scheduler to step forward one time step
        self.schedule.step()

# Function used by the data collector to calculate the mean love score across
# agents.  This will run at each time step.
def calculate_mean_love_score(model):
    list_of_love_scores = [agent.love_score for agent in model.schedule.agents]

    mean_love_score = sum(list_of_love_scores) / len(list_of_love_scores)

    return mean_love_score


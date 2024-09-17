import mesa

from mesa import Agent, Model
from mesa.time import RandomActivation # random order of agent actions
from mesa.space import MultiGrid # multiple agents per cell
from mesa.datacollection import DataCollector

import pandas as pd
import random
import multiprocessing
import matplotlib.pyplot as plt

# A class representing a 'HSMA' agent.  Note we're passing in the Agent class
# we imported from the mesa library.  Remember that this means our class here
# is inheriting from the 'parent' Agent class, and our class is the 'child',
# which inherits all the attributes and methods of the parent, but may have
# some of its own.
class HSMA_Agent(Agent):
    # Constructor
    def __init__(self, unique_id, model, initial_love_prob, persuasiveness_max):
        # Call the constructor from the parent Agent class, which will do all
        # the hard work of defining what an agent is - we just give it an ID
        # and a model that it will live in
        super().__init__(unique_id, model)

        # Determine if the agent should begin by loving or hating the HSMA
        # Programme, and set the agent's attribute accordingly
        if random.uniform(0, 1) < initial_love_prob:
            self.love_hsma = True
        else:
            self.love_hsma = False

        # Randomly determine the user's persuasiveness based on the max passed 
        # in
        self.persuasiveness = random.uniform(0.0, persuasiveness_max)
        
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
                # check if the agent has a different opinion to our agent
                # note - one of the inhabitants will be THIS agent, but that's
                # ok, because they will obviously have the same opinion as
                # themselves, and so the rest of the code won't action
                if inhabitant.love_hsma != self.love_hsma:
                    # Randomly determine whether this agent will influence the
                    # other agent's opinion, and change it to match theirs,
                    # based on this agent's persuasiveness
                    if random.uniform(0, 1) < self.persuasiveness:
                        # Change the other agent's opinion to match this agent's
                        inhabitant.love_hsma = self.love_hsma

    # Step method - this defines which of the agent's actions will be taken
    # on a time step, and in which order
    def step(self):
        # Randomly decide whether the agent should move on this time step.  
        # Here, there's a 50/50 chance they'll move
        if random.choice([True, False]) == True:
            self.move()

        # Regardless of whether or not the agent moved, it should begin its
        # talking behaviour for this time step
        self.talk()

# Class representing our ABS model
class Persuasion_Model(Model):
    # 2D Model initialisation constructor - initialise with N agents, and 
    # specified width and height.  Also pass in the things we need to pass
    # to our agents when instantiating them.
    def __init__(self, N, width, height, initial_love_prob, persuasiveness_max):
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
            a = HSMA_Agent(i, self, initial_love_prob, persuasiveness_max)
            
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
            model_reporters={"Total Loving HSMA":calculate_number_loving_hsma,
                             "Total Hating HSMA":calculate_number_hating_hsma},
            agent_reporters={}
        )

    # Function to advance the model by one step (we just tell the scheduler to
    # step forward one time step)
    def step(self):
        # Tell the data collector to collect the data for this time step
        self.datacollector.collect(self)
        
        # Ask scheduler to step forward one time step
        self.schedule.step()

# Function used by the data collector to calculate the total number of agents
# who love HSMA.  This will run at each time step.
def calculate_number_loving_hsma(model):
    total_loving_hsma = 0

    for agent in model.schedule.agents:
        if agent.love_hsma == True:
            total_loving_hsma += 1

    return total_loving_hsma

# Function used by the data collector to calculate the total number of agents
# who hate HSMA.  This will run at each time step.
def calculate_number_hating_hsma(model):
    total_hating_hsma = 0

    for agent in model.schedule.agents:
        if agent.love_hsma == False:
            total_hating_hsma += 1

    return total_hating_hsma

# Set the model parameters.  Where different values are to be tested across
# different scenarios, we specify as an iterable object (e.g. a list, a range
# of values etc)
params = {"width":10,
          "height":10,
          "N":range(5,105,5),
          "initial_love_prob":[0.25, 0.5, 0.75],
          "persuasiveness_max":[0.5, 0.75, 1.0]}

# Tell MESA to run the model as a batch run.  Specify the model class that
# represents the model, the parameters to use (specified above), the number of
# iterations to run for each parameter combination, how long to run each
# iteration in time steps, the number of processors to use (note : this must be
# set to 1 if you are on Windows unless you undertake a more complicated setup),
# how often (in time steps) to collect data from the datacollector (use -1 to 
# only collect results at the very end of a run), and whether or not to display 
# a progress bar.  Store the results of the model in a dictionary named results.
results = mesa.batch_run(
    Persuasion_Model,
    parameters=params,
    iterations=5,
    max_steps=250,
    number_processes=2,
    data_collection_period=-1,
    display_progress=True
)

# Store the results in a Pandas DataFrame for easier manipulation.
results_df = pd.DataFrame(results)

# Take mean number loving HSMA at end of each run for each scenario combination
# and put in a new DataFrame against those parameter combinations so we can
# more easily compare
scenario_df = pd.DataFrame()

for number_of_agents in range(5,105,5):
    for love_prob in [0.25, 0.5, 0.75]:
        for max_pers in [0.5, 0.75, 1.0]:
            # Find the rows relating to the runs for this scenario combination
            filtered_df = results_df.loc[
                (results_df["N"] == number_of_agents) &
                (results_df["initial_love_prob"] == love_prob) &
                (results_df["persuasiveness_max"] == max_pers)]
            
            # Take the mean across runs for this scenario combination
            mean_loving_hsma = filtered_df["Total Loving HSMA"].mean()

            # Create a dictionary with column names and values for our new
            # DataFrame
            temp_data = {
                "N": [number_of_agents],
                "initial_love_prob": [love_prob],
                "persuasiveness_max": [max_pers],
                "mean_loving_hsmas": [mean_loving_hsma]
            }

            # Create the new DataFrame
            temp_df = pd.DataFrame(temp_data)

            # Add the dataframe to the cumulative DataFrame
            scenario_df = pd.concat([scenario_df, temp_df], axis=0)

# Of course, it might also be useful to plot our data.  As an example, let's
# plot, for those scenarios where max persuasiveness is 100%, the mean number
# loving HSMA by the end for various numbers of agents (x axis) and for each
# tested initial love probability (different lines).

# Define x and y data for each plot
y_init_love_25 = scenario_df.loc[
    (scenario_df["initial_love_prob"] == 0.25) &
    (scenario_df["persuasiveness_max"] == 1.0)
]["mean_loving_hsmas"]

x_init_love_25 = scenario_df.loc[
    (scenario_df["initial_love_prob"] == 0.25) &
    (scenario_df["persuasiveness_max"] == 1.0)
]["N"]

y_init_love_50 = scenario_df.loc[
    (scenario_df["initial_love_prob"] == 0.5) &
    (scenario_df["persuasiveness_max"] == 1.0)
]["mean_loving_hsmas"]

x_init_love_50 = scenario_df.loc[
    (scenario_df["initial_love_prob"] == 0.5) &
    (scenario_df["persuasiveness_max"] == 1.0)
]["N"]

y_init_love_75 = scenario_df.loc[
    (scenario_df["initial_love_prob"] == 0.75) &
    (scenario_df["persuasiveness_max"] == 1.0)
]["mean_loving_hsmas"]

x_init_love_75 = scenario_df.loc[
    (scenario_df["initial_love_prob"] == 0.75) &
    (scenario_df["persuasiveness_max"] == 1.0)
]["N"]

# Set up figure and axes objects
figure_1, ax = plt.subplots()

# Set axis labels
ax.set_xlabel("Number of agents")
ax.set_ylabel("Mean number loving HSMA at end of run")

# Plot the three line plots
ax.plot(x_init_love_25, y_init_love_25, color='blue', 
        label="25% initial love")
ax.plot(x_init_love_50, y_init_love_50, color='green',
        label="50% initial love")
ax.plot(x_init_love_75, y_init_love_75, color='red',
        label="75% initial love")

# Add a legend
ax.legend(loc="upper left")

# Show the figure
figure_1.show()




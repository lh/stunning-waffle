# We'll first import from the module that we ourselves created!  We only need
# the Persuasion_Model class bit of the module here, so that's all we'll import
from hsma_love_hate_model import Persuasion_Model

# This will import the type of grid we want to visualise our agents
from mesa.visualization.modules import CanvasGrid

# Import required visualisation code for a Jupyter notebook
from mesa.experimental import JupyterViz

# Portrayal function that defines how agents will be drawn onto the grid
# We specify that the function takes an agent as its input - it will draw the
# agent passed to it in the manner we define in this function
def agent_portrayal(agent):
    # Size to draw an agent
    size = 60

    # Default colour of an agent
    color = "tab:grey"

    # Change colour to red if the agent loves HSMA
    color = (agent.love_hsma_score, 0, 1-agent.love_hsma_score)
    # Return the portrayal dictionary
    return {"size":size, "color":color}

#To set the transparancy of the colour
#color_value = ('green', agent.love_hsma_score)

# Set up visualisation elements
# Set up a CanvasGrid, that portrays agents as defined by the portrayal
# function we defined, has 10 x 10 cells, and a display size of 500x500 pixels
grid = CanvasGrid(agent_portrayal, 10, 10, 500, 500)

# Set up the model parameters that will be passed over as a dictionary, with
# keys representing the variable names used in our model.  For those that the 
# user can set, we set up a dictionary as the value, and can specify the type of
# interface element, starting value, min, max etc.
model_params = {
    "N":{
        "type":"SliderInt",
        "value":20,
        "label":"Number of HSMAs",
        "min":2,
        "max":100,
        "step":1
    },
    "initial_love_prob":{
        "type":"SliderFloat",
        "value":0.5,
        "label":"Probability love HSMA at start",
        "min":0.0,
        "max":1.0,
        "step":0.01
    },
    "persuasiveness_max":{
        "type":"SliderFloat",
        "value":1.0,
        "label":"Maximum persuasiveness",
        "min":0.0,
        "max":1.0,
        "step":0.01
    },
    "width":10,
    "height":10
}

# Create a Jupyter Visualisation to display the visualisation of our model.
# We pass in the model we want to visualise, the model parameters to pass to the
# model (defined in the dictionary above), the list of outcome measures that we
# want to plot (you can leave this as a blank list if you don't want to track
# anything), and the portrayal function we wrote above that defines how we want
# agents to be drawn
page = JupyterViz(
    Persuasion_Model,
    model_params,
    measures=["Total Loving HSMA", "Total Hating HSMA","Average HSMA Love"],
    agent_portrayal=agent_portrayal
)


# Now all we need to do is show the visualisation (note - this will only work
# in Jupyter - if you're running in VSCode, you should run this code in an 
# Interactive Window)
page


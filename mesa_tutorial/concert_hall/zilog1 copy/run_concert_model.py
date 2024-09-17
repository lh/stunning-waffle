from mesa.visualization.modules import CanvasGrid
from mesa.visualization.ModularVisualization import ModularServer
from mesa.visualization.UserParam import Slider
from concert_hall_model import ConcertHall, Exit, Toilet

def agent_portrayal(agent):
    if isinstance(agent, Exit):
        portrayal = {"Shape": "rect", "Color": "red", "Filled": "true", "Layer": 0, "w": 1, "h": 1}
    elif isinstance(agent, Toilet):
        portrayal = {"Shape": "rect", "Color": "blue", "Filled": "true", "Layer": 0, "w": 1, "h": 1}
    else:
        portrayal = {"Shape": "circle", "Color": "green", "Filled": "true", "Layer": 0, "r": 0.5}
    return portrayal

# Set up a CanvasGrid, that portrays agents as defined by the portrayal
# function we defined, has 92 x 30 cells, and a display size of 500x500 pixels
grid = CanvasGrid(agent_portrayal, 92, 30, 500, 500)

# Set up the model parameters that will be passed over as a dictionary, with
# keys representing the variable names used in our model. For those that the 
# user can set, we set up a dictionary as the value, and can specify the type of
# interface element, starting value, min, max etc.
model_params = {
    "width": 92,
    "height": 30,
    "num_agents": Slider("Number of Ravers", 20, 1, 100, 1),
    "music_quality": Slider("Music Quality", 1.0, 0.0, 10.0, 0.1)
}

server = ModularServer(ConcertHall, [grid], "Concert Hall Model", model_params)
server.port = 8521
server.launch()
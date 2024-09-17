
import concert_model_mesa

from concert_model_mesa import *


from mesa.visualization.modules import CanvasGrid


from mesa.experimental import JupyterViz

def agent_portrayal(agent):
    # Size to draw an agent
    size = 50

    # Default colour of an agent
    color = "tab:red"

def agent_portrayal(agent):
    if isinstance(agent, ConcertGoer):
        return {"shape": "circle", "filled": "true", "r": 0.5, "color": "red", "layer": 1}
    elif isinstance(agent, Wall):
        return {"shape": "rect", "filled": "true", "w": 1, "h": 1, "color": "black", "layer": 0}
    elif isinstance(agent, Stage):
        return {"shape": "rect", "filled": "true", "w": 1, "h": 1, "color": "yellow", "layer": 0}
    elif isinstance(agent, Bar):
        return {"shape": "rect", "filled": "true", "w": 1, "h": 1, "color": "blue", "layer": 0}
    elif isinstance(agent, Exit):
        return {"shape": "rect", "filled": "true", "w": 1, "h": 1, "color": "green", "layer": 0}
    elif isinstance(agent, Toilet):
        return {"shape": "rect", "filled": "true", "w": 1, "h": 1, "color": "purple", "layer": 0}
    

grid = CanvasGrid(agent_portrayal, 92, 30, 500, 500)

# Set up the model parameters that will be passed over as a dictionary, with
model_params = {
    "width":50,
    "height":20,
    "num_agents":{
        "type":"SliderInt",
        "value":20,
        "label":"Number of Ravers",
        "min":1,
        "max":1000,
        "step":1
    },   
}


page = JupyterViz(
    ConcertHall,
    model_params,
    measures=["Average Happiness"],
    agent_portrayal=agent_portrayal
)

page


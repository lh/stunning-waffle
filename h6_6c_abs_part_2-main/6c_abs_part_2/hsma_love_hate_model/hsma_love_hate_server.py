from hsma_love_hate_model import Persuasion_Model
from mesa.visualization.modules import CanvasGrid
from mesa.experimental import JupyterViz
import matplotlib.colors as mcolors

def agent_portrayal(agent):
    size = 60
    
    # Create a color gradient from red (hate) to white (neutral) to green (love)
    r = max(0, min(255, int(255 * (1 - agent.love_hsma))))
    g = max(0, min(255, int(255 * agent.love_hsma)))
    b = 0
    color = (r / 255, g / 255, b / 255)  # Convert to normalized RGB tuple

    return {"size": size, "color": color}

grid = CanvasGrid(agent_portrayal, 10, 10, 500, 500)

model_params = {
    "N": {
        "type": "SliderInt",
        "value": 20,
        "label": "Number of HSMAs",
        "min": 2,
        "max": 100,
        "step": 1
    },
    "initial_love_prob": {
        "type": "SliderFloat",
        "value": 0.5,
        "label": "Initial Love Probability",
        "min": 0.0,
        "max": 1.0,
        "step": 0.01
    }
}

# Create the model
model = Persuasion_Model(**model_params)

# Create the visualization
viz = JupyterViz(model, grid)
viz.run()


from hsma_love_hate_model import Persuasion_Model
from mesa.visualization.modules import CanvasGrid
from mesa.experimental import JupyterViz
import matplotlib.colors as mcolors

def agent_portrayal(agent):
    size = 60
    
    # Create a color gradient from red (hate) to white (neutral) to green (love)
    r = max(0, min(255, int(255 * (1 - agent.love_score))))
    g = max(0, min(255, int(255 * agent.love_score)))
    b = 0
    color = (r / 255, g / 255, b / 255)  # Convert to normalized RGB tuple

    return {"size": size, "color": color}

grid = CanvasGrid(agent_portrayal, 10, 10, 500, 500)

model_params = {
    "N": 20,
    "width": 10,
    "height": 10,
    "initial_love_prob": 0.5,
    "persuasiveness_max": 0.1
}

# Create the model
model = Persuasion_Model(**model_params)

# Create the visualization
viz = JupyterViz(model, grid)
viz.run()
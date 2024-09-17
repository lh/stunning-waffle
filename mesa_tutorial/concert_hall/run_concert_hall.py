from concert_hall_model import ConcertHall, agent_portrayal
from mesa.visualization.modules import CanvasGrid
from mesa.experimental import JupyterViz
from mesa.visualization.modules import ChartModule
from mesa.visualization.ModularVisualization import ModularServer

def run_interactive_model(jupyter=True):
    # Set up the grid visualization
    grid = CanvasGrid(agent_portrayal, 92, 30, 920, 300)

    # Set up charts
    happiness_chart = ChartModule([{"Label": "Average Happiness", "Color": "Black"}])
    bar_visits_chart = ChartModule([{"Label": "Average Bar Visits", "Color": "Blue"}])
    toilet_need_chart = ChartModule([{"Label": "Average Toilet Need", "Color": "Red"}])

    # Define model parameters
    model_params = {
        "width": 92,
        "height": 30,
        "num_agents": 100  # Set a default value
    }

    # Define visualization parameters (including UI elements)
    viz_params = {
        "num_agents": {
            "type": "slider",
            "value": 100,
            "min": 10,
            "max": 200,
            "step": 10,
            "description": "Number of Concert Goers"
        }
    }

    if jupyter:
        # Create the JupyterViz visualization
        viz = JupyterViz(
            ConcertHall,
            [grid, happiness_chart, bar_visits_chart, toilet_need_chart],
            "Concert Hall Model",
            model_params,
            viz_params
        )
    else:
        # Create the ModularServer for non-Jupyter environments
        viz = ModularServer(
            ConcertHall,
            [grid, happiness_chart, bar_visits_chart, toilet_need_chart],
            "Concert Hall Model",
            model_params
        )
    
    return viz

if __name__ == "__main__":
    # Detect if we're in a Jupyter environment
    try:
        get_ipython()
        in_jupyter = True
    except NameError:
        in_jupyter = False

    viz = run_interactive_model(jupyter=in_jupyter)
    
    if not in_jupyter:
        viz.launch()
    else:
        display(viz)
# Agent based simulation

## Introduction

ABS (or IBS for individual based simulation) can be used to simulate the behavior of a system of agents. Each agent is an individual entity that can interact with other agents and the environment. The agents can be simple or complex, and can be used to model a wide range of systems. ABS is used in many fields, including biology, economics, and social science. 

### Environment

The environment is the space in which the agents interact. It can be a physical space, such as a field or a city, or a virtual space, such as a computer simulation. The environment can be static or dynamic, and can have different properties, such as temperature, humidity, or terrain. The environment can also have different features, such as obstacles, resources, or other agents.

### Agents

The agents are the individual entities that interact with each other and the environment. Each agent has a set of properties, such as location, speed, or behaviour, and can perform actions, such as moving, eating, or reproducing. The agents can be simple or complex, and can have different behaviours, such as social, economic, or biological behaviours. The agents can also have different goals, such as survival, reproduction, or competition.

### Problems

They can be difficult to parameterize and validate, and can be computationally expensive. They can also be difficult to interpret and communicate, and can be sensitive to initial conditions and assumptions. 

## Design tips

- Only model relevant behaviours for the questions you are trying to answer
- Simplify modelled behaviours into _rules of thumb_ to reduce complexity


## Ideas

#### Which petrol station will people choose?

- Price
- Proximity
- Niceness

#### Which urinal will people choose? - Which gets the most use?

- As far from the next person as possible
- Nearest
- Not recently used

We will be using a python package for agent based simulation called `mesa`

In your design (and therefore your presentation), you should think about :
- Why you want to build the model - what are the question(s) you’re trying to answer?  What’s the emergent behaviour you’re looking to analyse?
- What agent(s) you will have in the simulation?
- What behaviours will your agent(s) have?  Will your agents learn, and if so, what and how?
- What will your environment represent?
- Will your agents interact with each other and / or the environment, and if so, how?
- Will your agents have specific motivations / goals / needs, and how will these be represented?
- What do you see as the primary reason(s) for choosing an Agent Based Simulation to model your chosen problem / system over other modelling approaches?

#### Behaviour at concerts

- People will move towards the stage
- People will move away from the stage to prepare to leave
- People will move towards the bar
- People will avoid being too close to others
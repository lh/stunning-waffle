# DES is good for queueing problems.

Anything where there is a pathway to the next state can be modelled as a 
queueing problem.

## Entities
-  patients: they flow through the system
    - arrive
    -  receptionist: they check in patients
    -  waiting room: they wait to be seen
    -  they see nurse
    - they see doctor
    - they see nurse
    - they checkout at reception
-  doctors
-  nurses
-  receptionist

We use SimPy to model the system.
SimPy is a discrete event simulation library. It uses blocks to represent the system.

Generally use OOP for SimPy

All HSMA code uses a template and uses four different classes

- g Class <- contains our parameters
- Patient <- our entity - a reproducable template for a person, each one records their experience as they pass through the system _a patient_
- Model <- our pathways. This is the big one that represent the sytem. Has a method for running a single simulation. _a run_
- Trial <- our experiment. This runs multiple simulations. _a trial_

# Runs and Trials

- A run is a single simulation of the system
- A trial is a collection of runs

We use randomisation to change the runs. This is called a Monte Carlo simulation.

When making a streamlit app of a simulation that runs, usually only need to control parameters in the g Class. 

__init__.py

is a file that needs to be in the same directory as the main.py file. It is a file that tells Python that the directory is a package. It can be empty.

We need to have an __init__.py file in the same directory as the main.py file so that we can import form our own files as if they are a package.
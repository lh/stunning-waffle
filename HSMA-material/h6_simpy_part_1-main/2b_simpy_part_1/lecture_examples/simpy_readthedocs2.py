import unittest
import simpy
import random
import pandas as pd
import numpy as np
import types

## start from the end and build around it
# first of all understand simpy
# then understand the problem

# simpy stuff

""" the environment is passed to the process which then uses it to create events eg the timeout events below. These are hard coded here but could be anything. The process is then passed to the environment which then runs it. The process is a generator function which yields events. The environment then runs the process until it yields an event. The environment then processes the event and then runs the process again until it yields another event. This continues until the process is exhausted. There is a back and forth between generator (process) and environment"""


def car(env, name, bcs, driving_time, charge_duration):
        # Start the run process every time an instance is created.
    yield env.timeout(driving_time)

    print(f"{name} arriving at {env.now}")
    with bcs.request() as req:
        yield req

        print(f"{name} starting to charge at {env.now}")
        yield env.timeout(charge_duration)
        print(f"{name} leaving the bcs at {env.now}")


env = (
    simpy.Environment()
)  # this is the environment and is created first in all simpy simulations
bcs = simpy.Resource(env, capacity = 2)

for i in range(4):
    env.process(car(env, f"Car {i}", bcs, i*2, 5)) # this is the process and is created second in all simpy simulations

env.run() # this is the environment running the process until the time limit is reached


# simpy testing stuff


class TestCars(unittest.TestCase):

    # setUp goes here

    # tests go here

    def test_envExists(self):
        self.assertIsNotNone(env)

    def test_isEnv(self):
        self.assertIsInstance(env, simpy.core.Environment)

    def test_carExists(self):
        self.assertIsNotNone(car)

    def test_isType(self):
        self.assertIsInstance(car, types.FunctionType) # as it is defined as a function or method, it is a Process in simpy terms. Had to import "types" to get the type of a function. 


if __name__ == "__main__":
    unittest.main()

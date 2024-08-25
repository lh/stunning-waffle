import unittest
import simpy
import random
import pandas as pd
import numpy as np


## start from the end and build around it
# first of all understand simpy
# then understand the problem

# simpy stuff

""" the environment is passed to the process which then uses it to creast events eg the timeout events below. These are hard coded here but could be anything. The process is then passed to the environment which then runs it. The process is a generator function which yields events. The environment then runs the process until it yields an event. The environment then processes the event and then runs the process again until it yields another event. This continues until the process is exhausted. There is a back and forth between generator (process) and environment"""


class Car(object):
    def __init__(self, env):
        self.env = env
        # Start the run process every time an instance is created.
        self.action = env.process(self.run())

    def run(self):
        while True:
            print("Start parking and charging at ", self.env.now)
            # adding interuption code

            charge_duration = 5
            
            try:
                yield self.env.process(self.charge(charge_duration))
                # this is a process that passes a timeout event from elsewhere
            except simpy.Interrupt:
                print("Was interrupted. Hope the battery is full enough ...")

            print("Start driving at ", self.env.now)
            trip_duration = 2
            yield self.env.timeout(trip_duration)
            # this is the timeout event

    def charge(self, duration):
        yield self.env.timeout(duration)  # this is a timeout event


def driver(env, car):
    yield env.timeout(3)  # we could change the call to timeout to be random
    car.action.interrupt()  # this is an interrupt event


env = (
    simpy.Environment()
)  # this is the environment and is created first in all simpy simulations

car = Car(env)

env.process(driver(env, car))
# setting an interrupt event to occur after 3 time units
env.run(
    until=15
)  # this is the environment running the process until the time limit is reached


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

    def test_isEnv(self):
        self.assertIsInstance(car, Car)


if __name__ == "__main__":
    unittest.main()

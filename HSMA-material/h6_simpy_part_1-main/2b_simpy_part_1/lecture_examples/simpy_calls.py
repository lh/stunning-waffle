# simpy_calls.py

import simpy
import unittest
import types



class g:
    call_interval = 10
    call_duration = 4
    duration = 100


env = simpy.Environment()

class Call(object):
    def __init__(self, env):
        self.env = env
    def calling(self):
        while True:
            yield self.env.timeout(g.call_interval)
            print(f"Call received at {self.env.now}")
            yield self.env.timeout(g.call_duration)
            print(f"Call ended at {self.env.now}")


call = Call(env)

env.process(call.calling())
env.run(until=g.duration)

class TestCalls(unittest.TestCase):


    def test_envExists(self):
            self.assertIsNotNone(env)

    def test_isEnv(self):
        self.assertIsInstance(env, simpy.core.Environment) 

    def test_isCar(self):
        self.assertIsInstance(call, Call)

    def test_isType(self):
        self.assertIsInstance(call.calling, types.MethodType)



if __name__ == "__main__":
    unittest.main()
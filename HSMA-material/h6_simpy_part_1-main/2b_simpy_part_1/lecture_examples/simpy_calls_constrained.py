# simpy_calls_constrained.py
# from simpy_calls.py with added constraint for receptionist as a resource. 

import simpy
import unittest
import types



class g:
    call_interval = 10
    call_duration = 4
    duration = 100
    receptionist_capacity = 1




class Call:
    def __init__(self, env, receptionist):
        self.env = env
        self.receptionist = receptionist

    def calling(self):
        while True:
            with self.receptionist.request() as request:
                yield request
                yield self.env.timeout(g.call_interval)
                print(f"Call received at {self.env.now}")
                yield self.env.timeout(g.call_duration)
                print(f"Call ended at {self.env.now}")
            




#############################################

env = simpy.Environment()
receptionist = simpy.Resource(env, capacity=1)
call = Call(env, receptionist)



env.process(call.calling())
env.run(until=g.duration)




#################################################
class TestCalls(unittest.TestCase):


    def test_envExists(self):
            self.assertIsNotNone(env)

    def test_isEnv(self):
        self.assertIsInstance(env, simpy.core.Environment) 

    def test_isCar(self):
        self.assertIsInstance(call, Call)

    def test_isType(self):
        self.assertIsInstance(call.calling, types.MethodType)

    def test_calling_is_generator(self):
        self.assertIsInstance(call.calling(), types.GeneratorType)

    def test_receptionist_is_resource(self):
        self.assertIsInstance(receptionist, simpy.Resource)

    def test_receptionist_capacity(self):
        self.assertEqual(receptionist.capacity, g.receptionist_capacity)

if __name__ == "__main__":
    unittest.main()

if __name__ == "__main__":
    unittest.main()
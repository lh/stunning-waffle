import simpy
import unittest
import types
import pandas as pd
import simpy_calls_and_attends as sca

class TestCalls(unittest.TestCase):

    def setUp(self):
        self.env = simpy.Environment()
        self.receptionist = simpy.Resource(self.env, capacity=1)
        self.doctor = simpy.Resource(self.env, capacity=1)
        self.call = sca.Call(self.env, self.receptionist)
        self.attendance = sca.Attend(self.env, self.receptionist, self.doctor)
        sca.Call.data = pd.DataFrame(columns=['Call_ID', 'Call_time', 'Wait_time', 'End_time'])
        sca.Call.call_counter = 0

    def test_envExists(self):
        self.assertIsNotNone(self.env)

    def test_isEnv(self):
        self.assertIsInstance(self.env, simpy.core.Environment) 

    def test_isCall(self):
        self.assertIsInstance(self.call, sca.Call)

    def test_isType(self):
        self.assertIsInstance(self.call.calling, types.MethodType)

    def test_calling_is_generator(self):
        self.assertIsInstance(self.call.calling(), types.GeneratorType)

    def test_receptionist_is_resource(self):
        self.assertIsInstance(self.receptionist, simpy.Resource)

    def test_receptionist_capacity(self):
        self.assertEqual(self.receptionist.capacity, 1)
    
    def test_attending_is_generator(self):
        self.assertIsInstance(self.attendance.attending(), types.GeneratorType)
    
    def test_attendance_is_Attend(self):
        self.assertIsInstance(self.attendance, sca.Attend)

    def test_call_interval_positive(self):
        self.assertGreater(sca.g.call_interval, 0)

    def test_call_duration_positive(self):
        self.assertGreater(sca.g.call_duration, 0)

    def test_arrival_interval_positive(self):
        self.assertGreater(sca.g.attend_interval, 0)

    def test_registration_duration_positive(self):
        self.assertGreater(sca.g.registration_duration, 0)

    def test_wait_time_is_correct(self):
        self.env.process(self.call.calling())
        self.env.run(until=2 * sca.g.call_interval)
        self.assertEqual(sca.Call.data['Wait_time'].iloc[-1], 0)

    def test_data_updates_correctly(self):
        self.env.process(self.call.calling())
        self.env.run(until=10 * sca.g.call_interval)
        expected_calls = int(10 * sca.g.call_interval / sca.g.call_interval)
        self.assertEqual(len(sca.Call.data), expected_calls)

class TestIntegration(unittest.TestCase):
    def setUp(self):
        self.env = simpy.Environment()
        self.receptionist = simpy.Resource(self.env, capacity=1)
        self.doctor = simpy.Resource(self.env, capacity=1)
        self.call = sca.Call(self.env, self.receptionist)
        self.attendance = sca.Attend(self.env, self.receptionist, self.doctor)

    def test_call_and_attend_at_same_time(self):
        self.env.process(self.call.calling())
        self.env.process(self.attendance.attending())
        self.env.run(until=max(sca.g.call_duration, sca.g.registration_duration))
        self.assertEqual(self.receptionist.count, 1)

    def test_patient_sees_doctor_after_registration(self):
        def process_and_wait_for_finish():
            yield self.env.process(self.attendance.attending())
            yield self.attendance.finished  # Wait for the 'finished' event to be triggered

        self.env.process(process_and_wait_for_finish())

        self.assertEqual(self.doctor.count, 0)  # assuming the doctor is free after the visit
        self.env.run(until=sca.g.duration)

if __name__ == "__main__":
    unittest.main()
import unittest
from unittest.mock import patch, Mock
from GP_phone_sim import Trial, Model, Patient, g


class TestG(unittest.TestCase):
    def test_initialization(self):
        g_instance = g()

        self.assertEqual(g_instance.mean_call_interval, 10)
        self.assertEqual(g_instance.mean_call_duration, 4)
        self.assertEqual(g_instance.mean_patient_interval, 3)
        self.assertEqual(g_instance.mean_patient_registration, 2)
        self.assertEqual(g_instance.mean_patient_gp, 8)
        self.assertEqual(g_instance.mean_patient_test, 4)
        self.assertEqual(g_instance.surgery_open, 8 * 60)
        self.assertEqual(g_instance.receptionists, 1)
        self.assertEqual(g_instance.gps, 2)
        self.assertEqual(g_instance.trial_runs, 100)

class TestPatient(unittest.TestCase):
    def setUp(self):
        self.patient = Patient(1)

    def test_init(self):
        self.assertEqual(self.patient.p_id, 1)
        self.assertEqual(self.patient.call_duration, 0)
        self.assertEqual(self.patient.call_q_time, 0)
        self.assertEqual(self.patient.call_end_time, 0)
        self.assertEqual(self.patient.patient_registration_q_time, 0)
        self.assertEqual(self.patient.patient_gp_q_time, 0)
        self.assertEqual(self.patient.patient_test_q_time, 0)
        self.assertEqual(self.patient.total_q_time, 0)
        self.assertEqual(self.patient.total_time, 0)

class TestModel(Model):  # subclass Model for testing
    def run(self):  # override run method to avoid running the actual model
        self.total_q_time = 1  # set a fixed total_q_time for testing

class TestTrial(unittest.TestCase):
    def setUp(self):
        self.trial = Trial()

    @patch('GP_phone_sim.Model', new=TestModel)
    def test_run_trial(self):
        self.trial.run_trial()

        # Check that df_trial_results was updated correctly
        for run in range(g.trial_runs):
            self.assertEqual(self.trial.df_trial_results.loc[run, 'mean_q_time_phone'], 1)



class TestModel(Model):  # Make TestModel a subclass of Model
    def __init__(self, run_number):
        super().__init__(run_number)  # Call the parent class's __init__ method
        self.mean_q_time = 1  # Add this line
        print("mean_q_time from def: ", self.mean_q_time)
    @patch('random.expovariate')
    def test_generator_patient_calls(self, mock_expovariate):
        mock_expovariate.return_value = 1  # Mock the call to random.expovariate
        self.model.env.process = Mock()  # Mock the call to self.env.process

        # Run the generator for one iteration
        next(self.model.generator_patient_calls())

        # Check that a new patient was created and the patient calling process was started
        self.assertEqual(self.model.patient_counter, 1)
        self.model.env.process.assert_called_once()
        print("mean_q_time from test_generator_patient_calls: ", self.mean_q_time)

    @patch('random.expovariate')
    def test_call_clinic(self, mock_expovariate):
        mock_expovariate.return_value = 1  # Mock the call to random.expovariate
        patient = Mock()  # Create a mock patient

        # Run the call_clinic method
        self.model.env.process(self.model.call_clinic(patient))

        # Check that the receptionist was requested and the call duration was set
        self.model.env.run()  # Run the simulation  for one time unit
        self.assertEqual(self.model.env.now, 1)
        print("mean_q_time from random.expovariate: ", self.mean_q_time)



def test_mean_q_time_phone(self):
    # Mock the random.expovariate function to return a fixed value
    with patch('random.expovariate') as mock_expovariate:
        mock_expovariate.return_value = 1
        print("mean_q_time from test_mean_q_time_phone 1: ", self.mean_q_time)

        # Create a few patients and have them call the clinic
        for _ in range(3):
            patient = Patient(self.model.patient_counter + 1)
            self.model.env.process(self.model.call_clinic(patient))
            self.model.env.run()
        print("mean_q_time from test_mean_q_time_phone 2: ", self.mean_q_time)
        # Calculate the mean queue time
        self.model.calculate_run_results()
        print("mean_q_time from test_mean_q_time_phone 3: ", self.mean_q_time)
        # Check that mean_q_time_phone was written to correctly
        expected_mean_q_time_phone = self.model.results_df['call_q_time'].mean()
        self.assertEqual(self.model.mean_q_time_phone, expected_mean_q_time_phone)

if __name__ == '__main__':
    unittest.main()
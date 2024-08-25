import simpy
import random
import pandas as pd

# Class to store global parameter values.  We don't create an instance of this
# class - we just refer to the class blueprint itself to access the numbers
# inside.
class g:
    patient_inter = 3
    mean_reception_time = 2
    mean_gp_consult_time = 8 
    mean_book_test_time = 4 
    portion_of_book_test = 0.25
    mean_reception_phone_inter = 10 
    mean_reception_phone_time = 4 
    number_of_receptionists = 1
    number_of_doctors = 2 
  #  prob_seeing_doctor 
    sim_duration = 480
    number_of_runs = 5 #(while testing)

# Class representing patients coming in to the clinic.
class Patient:
    def __init__(self, p_id):
        self.id = p_id
        self.q_time_reception = 0
        self.q_time_phone = 0
        self.q_time_doctor = 0
        self.face_to_face = True

# Class representing our model of the clinic.
class Model:
    # Constructor to set up the model for a run.  We pass in a run number when
    # we create a new model.
    def __init__(self, run_number):
        # Create a SimPy environment in which everything will live
        self.env = simpy.Environment()

        # Create a patient counter (which we'll use as a patient ID)
        self.patient_counter = 0

        # Create our resources
        self.receptionist = simpy.Resource(
            self.env, capacity=g.number_of_receptionists
        )
        self.doctor = simpy.Resource(
            self.env, capacity=g.number_of_doctors)

        # Store the passed in run number
        self.run_number = run_number

        # Create a new Pandas DataFrame that will store some results against
        # the patient ID (which we'll use as the index).
        self.results_df = pd.DataFrame()
        self.results_df["Patient ID"] = [1]
        self.results_df["Q Time Reception"] = [0.0]
        self.results_df["Q Time Phone"] = [0.0]
        self.results_df["Q Time Doctor"] = [0.0]
        self.results_df.set_index("Patient ID", inplace=True)

        # Create an attribute to store the mean queuing times across this run of
        # the model
        self.mean_q_time_reception = 0
        self.mean_q_time_phone = 0
        self.mean_q_time_doctor = 0 ##NEW

    # A generator function that represents the DES generator for patient
    # arrivals
    def generator_patient_arrivals(self):
        # We use an infinite loop here to keep doing this indefinitely whilst
        # the simulation runs
        while True:
            self.patient_counter += 1
            p = Patient(self.patient_counter)
            self.env.process(self.attend_clinic(p))
            sampled_inter = random.expovariate(1.0 / g.patient_inter)
            yield self.env.timeout(sampled_inter)
    # A generator function that represents the DES generator for patient
    # calls
    def generator_patient_calls(self):
        while True:
            self.patient_counter += 1
            p = Patient(self.patient_counter)
            self.env.process(self.call_clinic(p))
            sampled_inter = random.expovariate(1.0 / g.mean_reception_phone_inter)
            yield self.env.timeout(sampled_inter)

    def attend_clinic(self, patient):
        start_q_recep = self.env.now
        with self.receptionist.request() as req:
            yield req
            end_q_recep = self.env.now
            patient.q_time_recep = end_q_recep - start_q_recep
            sampled_recep_act_time = random.expovariate(
                1.0 / g.mean_reception_time
            )
            self.results_df.at[patient.id, "Q Time Reception"] = (
                patient.q_time_recep
            )
            yield self.env.timeout(sampled_recep_act_time)

    def call_clinic(self, patient):
        start_phone = self.env.now
        with self.receptionist.request() as req:
            yield req
            end__phone = self.env.now
            patient.q_time_phone = end__phone - start_phone
            sampled_phone_time = random.expovariate(
                1.0 / g.mean_reception_phone_time
            )
            self.results_df.at[patient.id, "Q Time Phone"] = (
                patient.q_time_phone
            )
            yield self.env.timeout(sampled_phone_time)




        ##NEW added conditional logic to see if patient goes on to see doctor
        # We sample from the uniform distribution between 0 and 1.  If the value
        # is less than the probability of seeing a doctor (stored in g Class)
        # then we say the patient sees a doctor.
        # If not, this block of code won't be run and the patient will just
        # leave the system (we could add in an else if we wanted a branching
        # path to another activity instead)
        if random.uniform(0,1) < g.prob_seeing_doctor:
            start_q_doctor = self.env.now

            with self.doctor.request() as req:
                yield req

                end_q_doctor = self.env.now

                patient.q_time_doctor = end_q_doctor - start_q_doctor

                sampled_doctor_act_time = random.expovariate(
                    1.0 / g.mean_d_consult_time
                )

                self.results_df.at[patient.id, "Q Time Doctor"] = (
                    patient.q_time_doctor
                )
                self.results_df.at[patient.id, "Time with Doctor"] = (
                    sampled_doctor_act_time
                )

                yield self.env.timeout(sampled_doctor_act_time)

    # This method calculates results over a single run.  Here we just calculate
    # a mean, but in real world models you'd probably want to calculate more.
    def calculate_run_results(self):
        # Take the mean of the queuing times across patients in this run of the 
        # model.
        self.mean_q_time_recep = self.results_df["Q Time Recep"].mean()
        self.mean_q_time_nurse = self.results_df["Q Time Nurse"].mean()
        self.mean_q_time_doctor = self.results_df["Q Time Doctor"].mean() ##NEW

    # The run method starts up the DES entity generators, runs the simulation,
    # and in turns calls anything we need to generate results for the run
    def run(self):
        # Start up our DES entity generators that create new patients.  We've
        # only got one in this model, but we'd need to do this for each one if
        # we had multiple generators.
        self.env.process(self.generator_patient_arrivals())
        self.env.process(self.generator_patient_calls())

        # Run the model for the duration specified in g class
        self.env.run(until=g.sim_duration)

        # Now the simulation run has finished, call the method that calculates
        # run results
        self.calculate_run_results()

        # Print the run number with the patient-level results from this run of 
        # the model
        print (f"Run Number {self.run_number}")
        print (self.results_df)

# Class representing a Trial for our simulation - a batch of simulation runs.
class Trial:
    # The constructor sets up a pandas dataframe that will store the key
    # results from each run against run number, with run number as the index.
    def  __init__(self):
        self.df_trial_results = pd.DataFrame()
        self.df_trial_results["Run Number"] = [0]
        self.df_trial_results["Mean Q Time Recep"] = [0.0]
        self.df_trial_results["Mean Q Time Nurse"] = [0.0]
        self.df_trial_results["Mean Q Time Doctor"] = [0.0] ##NEW
        self.df_trial_results.set_index("Run Number", inplace=True)

    # Method to print out the results from the trial.  In real world models,
    # you'd likely save them as well as (or instead of) printing them
    def print_trial_results(self):
        print ("Trial Results")
        print (self.df_trial_results)

    # Method to run a trial
    def run_trial(self):
        # Run the simulation for the number of runs specified in g class.
        # For each run, we create a new instance of the Model class and call its
        # run method, which sets everything else in motion.  Once the run has
        # completed, we grab out the stored run results (just mean queuing time
        # here) and store it against the run number in the trial results
        # dataframe.
        for run in range(g.number_of_runs):
            my_model = Model(run)
            my_model.run()
            
            ##NEW - added mean queue time for doctor to end of list
            self.df_trial_results.loc[run] = [my_model.mean_q_time_recep,
                                              my_model.mean_q_time_nurse,
                                              my_model.mean_q_time_doctor]

        # Once the trial (ie all runs) has completed, print the final results
        self.print_trial_results()

# Create an instance of the Trial class
my_trial = Trial()

# Call the run_trial method of our Trial object
my_trial.run_trial()


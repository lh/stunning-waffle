import simpy
import random
import pandas as pd

class g:
    patient_inter = .01
    mean_reception_time = .1
    mean_n_consult_time = .1
    mean_d_consult_time = .1 
    number_of_receptionists = 1
    number_of_nurses = 1
    number_of_doctors = 1 
    prob_seeing_doctor = 1
    sim_duration = 10
    number_of_runs = 1

class Patient:
    def __init__(self, p_id):
        self.id = p_id
        self.q_time_recep = 0
        self.q_time_nurse = 0
        self.q_time_doctor = 0 

class Model:
    
    def __init__(self, run_number):
        
        self.env = simpy.Environment()
        self.patient_counter = 0
        self.receptionist = simpy.Resource(
            self.env, capacity=g.number_of_receptionists
        )
        self.nurse = simpy.Resource(self.env, capacity=g.number_of_nurses)
        self.doctor = simpy.Resource(
            self.env, capacity=g.number_of_doctors) 

        self.run_number = run_number
        self.results_df = pd.DataFrame()
        self.results_df["Patient ID"] = [1]
        self.results_df["Q Time Recep"] = [0.0]
        self.results_df["Time with Recep"] = [0.0]
        self.results_df["Q Time Nurse"] = [0.0]
        self.results_df["Time with Nurse"] = [0.0]
        self.results_df["Q Time Doctor"] = [0.0] 
        self.results_df["Time with Doctor"] = [0.0] 
        self.results_df.set_index("Patient ID", inplace=True)

        self.mean_q_time_recep = 0
        self.mean_q_time_nurse = 0
        self.mean_q_time_doctor = 0 

    def generator_patient_arrivals(self):
        
        while True:
            
            self.patient_counter += 1
            p = Patient(self.patient_counter)
            print (f"Patient {p.id} arrives at {self.env.now}")
            self.env.process(self.attend_clinic(p))
            print (f"Patient {p.id} leaves at {self.env.now}")
            sampled_inter = g.patient_inter 
            #random.expovariate(1.0 / g.patient_inter)
            yield self.env.timeout(sampled_inter)

    def attend_clinic(self, patient):
        start_q_recep = self.env.now

        with self.receptionist.request() as req:
            yield req
            end_q_recep = self.env.now
            patient.q_time_recep = end_q_recep - start_q_recep
            sampled_recep_act_time = g.mean_reception_time 
            # random.expovariate(1.0 / g.mean_reception_time)
            self.results_df.at[patient.id, "Q Time Recep"] = (
                patient.q_time_recep
            )
            self.results_df.at[patient.id, "Time with Recep"] = (
                sampled_recep_act_time
            )
            print (f"Patient {patient.id} starts with receptionist at {self.env.now}")
            yield self.env.timeout(sampled_recep_act_time)

        start_q_nurse = self.env.now
        print (f"Patient {patient.id} starts with nurse at {self.env.now}")
        with self.nurse.request() as req:
            yield req
            end_q_nurse = self.env.now
            patient.q_time_nurse = end_q_nurse - start_q_nurse
            sampled_nurse_act_time = g.mean_n_consult_time 
            # random.expovariate(1.0 / g.mean_n_consult_time)
            self.results_df.at[patient.id, "Q Time Nurse"] = (
                patient.q_time_nurse)
            self.results_df.at[patient.id, "Time with Nurse"] = (
                sampled_nurse_act_time)
            print (f"Patient {patient.id} starts with nurse at {self.env.now}")
            yield self.env.timeout(sampled_nurse_act_time)
            print (f"Patient {patient.id} leaves nurse at {self.env.now}")

        if random.uniform(0,1) < g.prob_seeing_doctor:
            print (f"Patient {patient.id} starts_1 with doctor at {self.env.now}")
            start_q_doctor = self.env.now

            with self.doctor.request() as req:
                yield req
                end_q_doctor = self.env.now
                patient.q_time_doctor = end_q_doctor - start_q_doctor
                sampled_doctor_act_time = g.mean_d_consult_time 
                #random.expovariate(1.0 / g.mean_d_consult_time)
                self.results_df.at[patient.id, "Q Time Doctor"] = (
                    patient.q_time_doctor
                )
                self.results_df.at[patient.id, "Time with Doctor"] = (
                    sampled_doctor_act_time
                )
                print (f"Patient {patient.id} starts_2 with doctor at {self.env.now}")
                yield self.env.timeout(sampled_doctor_act_time)
                print (f"Patient {patient.id} leaves doctor at {self.env.now}")

    def calculate_run_results(self):
        self.mean_q_time_recep = self.results_df["Q Time Recep"].mean()
        self.mean_q_time_nurse = self.results_df["Q Time Nurse"].mean()
        self.mean_q_time_doctor = self.results_df["Q Time Doctor"].mean() 

    def run(self):
        self.env.process(self.generator_patient_arrivals())
        self.env.run(until=g.sim_duration)
        self.calculate_run_results()
        print (f"Run Number {self.run_number}")
        print (self.results_df)

class Trial:
    
    def  __init__(self):
        self.df_trial_results = pd.DataFrame()
        self.df_trial_results["Run Number"] = [0]
        self.df_trial_results["Mean Q Time Recep"] = [0.0]
        self.df_trial_results["Mean Q Time Nurse"] = [0.0]
        self.df_trial_results["Mean Q Time Doctor"] = [0.0] 
        self.df_trial_results.set_index("Run Number", inplace=True)

    def print_trial_results(self):
        print ("Trial Results")
        print (self.df_trial_results)

    def run_trial(self):
        
        for run in range(g.number_of_runs):
            my_model = Model(run)
            my_model.run()
            
            self.df_trial_results.loc[run] = [my_model.mean_q_time_recep,
                                              my_model.mean_q_time_nurse,
                                              my_model.mean_q_time_doctor]

        self.print_trial_results()

my_trial = Trial()

my_trial.run_trial()

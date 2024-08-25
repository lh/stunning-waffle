import simpy
import random
import pandas as pd
import numpy as np


"""
Patients arrive into the GP surgery around every 3 minutes, spend around 2 minutes being registered and then around 8 minutes with the GP.  Around a quarter of patients need to book a test at reception after they’ve seen the GP, and this takes around 4 minutes.  In addition to registering patients and booking tests, receptionists also answer incoming calls, which come in around every 10 minutes and last about 4 minutes.

The surgery currently has 1 receptionist and 2 GPs.  They feel there is a problem in their system as they are receiving complaints about lengthy delays both from patients and callers.  They want you to build a simulation model to find out what’s happening and propose some solutions.  Your model should represent a “day in the life” of the surgery, which is open to both in-person patients and telephone callers for 8 hours continuously.

Your trial should be at least 100 runs of the simulation.  In terms of outputs, the surgery is only interested in queuing times for each of the queues in the system (you don’t need to worry about storing sampled activity times for example), but they would like to look at the results for patients and callers separately.  You should give them mean results as a minimum, but you may consider providing additional results too if you have time.

You also need to calculate and provide them with the mean queuing times across the trial (eg mean queue for registration across all runs, for GP etc - so four numbers that you would report).  You’ll need a new method in your Trial class to calculate this.  You should find this a helpful output, as it’ll help you compare scenarios easily.  Report these means to 1 decimal place.

Once you’ve built the model, use it to a) identify where you think the problem is, and b) proposals for how you would fix it (this can include anything you like - they are open to suggestions - more resources, changes to processes to cut activity times, having the GP book the test, anything you can think of!  Try different things, different solutions.  Tip - take a copy of the original working file for the base case scenario first :) )
"""

# Plan

# patient calls surgery at defined distribution, call ends after defined distribution, patient to sink.

# repeat process and take details

# global parameters


class g:
    mean_call_interval = 10
    mean_call_duration = 4
    mean_patient_interval = 3
    mean_patient_registration = 2
    mean_patient_gp = 8
    mean_patient_test = 4
    surgery_open = 8 * 60
    receptionists = 1
    gps = 2
    trial_runs = 1


# classes


class Patient:
    def __init__(self, p_id):
        self.p_id = p_id
        self.call_duration = 0
        self.call_q_time = 0
        self.call_end_time = 0
        self.patient_registration_q_time = 0
        self.patient_gp_q_time = 0
        self.patient_test_q_time = 0
        self.total_q_time = 0
        self.total_time = 0


class Model:
    def __init__(self, run_number):
        self.run_number = run_number
        self.env = simpy.Environment()
        self.patient_counter = 0
        self.receptionist = simpy.Resource(
            self.env, capacity=g.receptionists
        )  # resource for receptionist

        # pandas dataframe to store results against patient id
        self.results_df = pd.DataFrame()
        self.results_df["p_id"] = [1]
        self.results_df["call_end_time"] = [0.0]  # time call ends
        self.results_df["call_duration"] = [0.0]
        self.results_df["call_q_time"] = [0.0]
        self.results_df["registration_end_time"] = [0.0]  # time registration ends
        self.results_df["registration_duration"] = [0.0]
        self.results_df["patient_registration_q_time"] = [0.0]
        self.results_df["patient_gp_q_time"] = [0.0]
        self.results_df["patient_test_q_time"] = [0.0]
        self.results_df["gp_end_time"] = [0.0]  # time gp ends
        self.results_df["test_end_time"] = [0.0]  # time test ends
        self.results_df["total_q_time"] = [0.0]  # total time in queue for this patient
        self.results_df["total_time"] = [0.0]  # total time in system for this patient
        self.results_df.set_index("p_id", inplace=True)  # set the p_id as the index

        self.total_q_time_reception = (
            0.0  # total time in reception queue for all patients
        )
        self.mean_q_time_reception = 0.0  # to store the mean across the runs
        self.total_q_time = 0.0
        self.mean_q_time = 0.0

    def generator_patient_calls(self):  # generates patient calls
        while True:
            self.patient_counter += 1
            p = Patient(self.patient_counter)  # create a new patient
            self.env.process(self.call_clinic(p))  # start the patient calling process
            yield self.env.timeout(
                random.expovariate(1.0 / g.mean_call_interval)
            )  # patient calls at defined distribution

    def call_clinic(self, patient):  # patient calls clinic
        with self.receptionist.request() as req:  # request receptionist
            yield req  # wait for receptionist
            call_start_time = self.env.now  # record time call starts
            call_duration = random.expovariate(
                1.0 / g.mean_call_duration
            )  # call ends after defined distribution
            yield self.env.timeout(call_duration)

            # call has ended, record the times
            self.results_df.at[patient.p_id, "call_end_time"] = self.env.now
            self.results_df.at[patient.p_id, "call_duration"] = call_duration
            self.results_df.at[patient.p_id, "call_q_time"] = (
                self.env.now - call_start_time
            )

    def generator_patient_arrives(self):  # generates patient calls
        while True:
            self.patient_counter += 1
            p = Patient(self.patient_counter)  # create a new patient
            self.env.process(self.visit_clinic(p))  # start the patient visit process
            yield self.env.timeout(
                random.expovariate(1.0 / g.mean_patient_interval)
            )  # patient arrivals at defined distribution

    def visit_clinic(self, patient):  # patient calls clinic
        with self.receptionist.request() as req:  # request receptionist
            yield req  # wait for receptionist
            registration_start_time = self.env.now  # record time call starts
            registration_duration = random.expovariate(
                1.0 / g.mean_patient_registration
            )  # call ends after defined distribution
            yield self.env.timeout(registration_duration)

            # registration has ended, record the times
            self.results_df.at[patient.p_id, "registration_end_time"] = self.env.now
            self.results_df.at[patient.p_id, "registration_duration"] = (
                registration_duration
            )
            self.results_df.at[patient.p_id, "patient_registration_q_time"] = (
                self.env.now - registration_start_time
            )

    def calculate_run_results(self):  # calculates results for this run
        self.total_q_time = (
            self.results_df["call_q_time"].sum()
            + self.results_df["patient_registration_q_time"].sum()
        )

        # can I adapt the next line to add together the two numbers and find a mean?
        self.mean_q_time_phone = self.results_df["call_q_time"].mean()

    #        print("total_q_time (calculate_run_results): ", self.total_q_time )
    #        print("mean_q_time (calculate_run_results): ", self.mean_q_time )

    def run(self):  # runs the model
        self.env.process(
            self.generator_patient_calls()
        )  # start the patient calling process
        self.env.process(
            self.generator_patient_arrives()
        )  # start the patient arrival process
        self.env.run(until=g.surgery_open)  # run the model for the defined time
        self.calculate_run_results()  # calculate results for this run
        self.total_q_time_reception += (
            self.results_df["call_q_time"].sum()
            + self.results_df["patient_registration_q_time"].sum()
        )
        print(
            "total_q_time_reception: ", self.total_q_time_reception
        )  # print the total time in reception queue for all patients

        print(
            "patient_registration_q_time: ",
            self.results_df["patient_registration_q_time"],
        )  # print the time in registration queue for each patient
        print(
            "call_q_time: ", self.results_df["call_q_time"]
        )  # print the time in phone queue for each patient

        # add the total time in all reception queues for this run to the total time in all reception queues for all runs
        self.mean_q_time_reception = self.total_q_time_reception / (
            self.run_number + 1
        )  # calculate the mean time in reception queue across all runs
        print(
            "mean_q_time_reception: ", self.mean_q_time_reception
        )  # print the mean time in reception queue for all patients

        self.results_df["total_time"] = (
            self.results_df["call_duration"] + self.results_df["total_q_time"]
        )  # calculate the total time in system for this patient
        self.results_df.to_csv("results.csv")  # save results to csv
        print(
            "mean time in phone queue: ", self.results_df["call_q_time"].mean()
        )  # print the mean time in phone queue for this run
        print(
            "mean time in registration queue: ",
            self.results_df["patient_registration_q_time"].mean(),
        )  # print the mean time in reception queue for this run


class Trial:  # runs the model multiple times
    def __init__(self):  # initialise the trial
        self.df_trial_results = (
            pd.DataFrame()
        )  # create a dataframe to store the results
        self.df_trial_results["run_number"] = [0]  # add a column for the run number
        # self.df_trial_results['mean_q_time_reception'] = [0.0] # add a column for the mean time in reception queue
        # self.df_trial_results['mean_q_time_gp'] = [0.0] # add a column for the mean time in gp queue
        # self.df_trial_results['mean_q_time_test'] = [0.0] # add a column for the mean time in test queue
        # self.df_trial_results['mean_q_time_total'] = [0.0] # add a column for the mean time in total queue
        # self.df_trial_results['mean_time_in_system'] = [0.0] # add a column for the mean time in system
        self.df_trial_results["mean_q_time_phone"] = [
            0.0
        ]  # add a column for the mean time in system
        self.df_trial_results["mean_q_time_reception"] = [
            0.0
        ]  # add a column for the mean time in system
        self.df_trial_results.set_index(
            "run_number", inplace=True
        )  # set the run number as the index

    def print_trial_results(self):  # print the results of the trial
        print("Trial Results")
        print(self.df_trial_results)

    def run_trial(self):  # run the trial
        for run in range(g.trial_runs):  # for each run
            my_model = Model(run)  # create a new model
            my_model.run()  # run the model
            self.df_trial_results.loc[run, "mean_q_time_phone"] = [
                my_model.mean_q_time_phone
            ]  # add the mean time in reception queue for this run to the dataframe
            self.df_trial_results.loc[run, "mean_q_time_reception"] = [
                my_model.mean_q_time_reception
            ]  # add the mean time in reception queue for this run to the dataframe
        self.print_trial_results()  # print the results of the trial


my_trial = Trial()  # create a new trial
print("=============================================")
print("           Running the trial")
print("=============================================")
print(" ")
print(" ")
my_trial.run_trial()  # run the trial

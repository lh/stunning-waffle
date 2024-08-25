# simpy_calls_and _attends.py
# from simpy_calls_constrained.py with added patient attendance for receptionist as a resource. 

import simpy
import unittest
import types
import pandas as pd
import random
import logging
import matplotlib
import PIL
import matplotlib.pyplot as plt
import seaborn as sns


logging.basicConfig(filename='debug.log', 
                    filemode='w',
                    level=logging.DEBUG, 
                    format='%(message)s')


# Set matplotlib.pyplot's logging level to CRITICAL
logging.getLogger('matplotlib.pyplot').setLevel(logging.CRITICAL)

# Set matplotlib's and PIL's logging level to CRITICAL
logging.getLogger('matplotlib').setLevel(logging.CRITICAL)
logging.getLogger('PIL').setLevel(logging.CRITICAL)
logging.getLogger('matplotlib.font_manager').setLevel(logging.CRITICAL)

class g:
    duration = 30 # GP 10 hour day, sampling just the first hour...

    attend_interval = 3
    registration_duration = 2
    doctor_visit_duration = 8
    test_booking_duration = 4

    call_interval = 10
    call_duration = 4

    receptionist_capacity = 1
    doctor_capacity = 2

    test_chance = 1

    simulation_runs = 4

    queue_times_df = pd.DataFrame(columns=['ID', 'Run', 'Queue_Type', 'Queue_Time'])

run =1  #**temporary until runs are implemented

class Call:
    """
    A class used to represent a Call process in a simulation environment.

    ...

    Attributes
    ----------
    call_counter : int
        a class variable shared by all instances, used to count the number of calls
    data : pd.DataFrame
        a class variable shared by all instances, used to store call details
    env : simpy.Environment
        the simulation environment
    receptionist : simpy.Resource
        the receptionist resource

    Methods
    -------
    calling():
        Initiates a call every `g.call_interval` time units.
    handle_call(call_time):
        Handles a call, waits for `g.call_duration` time units, and logs the call details.
    """
    @classmethod
    def reset(cls):
        cls.call_counter = 0
    

    data = pd.DataFrame(columns=['Call_ID', 'Call_time', 'Wait_time', 'End_time']) # this is a class variable and is shared by all instances of the class

    def __init__(self, env, receptionist):
        self.env = env
        self.receptionist = receptionist
# note the structure of having two processes, one doing every call_interval time units and the other doing for 3 call_duration time unit. Because the first one calls the second one it carries on (or tries to carry on) regardless of what the second is doing. 
    def calling(self, run):
        """
        Initiates a call every `g.call_interval` time units.

        Yields
        ------
        simpy.Timeout
            a timeout event that occurs after `g.call_interval` time units
        """
# by yielding at he end of the process the process is paused until the next event is yielded. That means the pause takes place after the event has happened. So the day starts with a call without a wait before the call is made. 
        while True:
            Call.call_counter += 1 
            call_time = self.env.now
            logging.debug(f"Run {run}\t Call\t{Call.call_counter} incoming at {call_time}")
            self.env.process(self.handle_call(call_time, run))
            yield self.env.process(self.handle_call(call_time, run))

    def handle_call(self, call_time, run):
        """
        Handles a call, waits for `g.call_duration` time units, and logs the call details.

        Parameters
        ----------
        call_time : float
            the time the call was initiated

        Yields
        ------
        simpy.Timeout
            a timeout event that occurs after `g.call_duration` time units
        """        
        with self.receptionist.request() as request:
            yield request
            wait_time = self.env.now - call_time
            g.queue_times_df = pd.concat([g.queue_times_df, pd.DataFrame.from_records([
                {'ID': Call.call_counter
                , 'Run': run
                , 'Queue_Type': 'Call'
                , 'Queue_Time': wait_time}])]
                , ignore_index=True
                )
            logging.debug(f"Run {run}\t Call\t{Call.call_counter}  answered\t\t{self.env.now}")
            yield self.env.timeout(g.call_duration)
            end_time = self.env.now
            logging.debug(f"Run {run} \t Call\t{Call.call_counter}  ended\t {end_time}")
            logging.debug(f"Run {run}\t Call\t{Call.call_counter}  waited for {wait_time}")
            new_row = pd.DataFrame({'Call_ID': [Call.call_counter], 'Call_time': [call_time], 'Wait_time': [wait_time], 'End_time': [end_time]})
            Call.data = pd.concat([Call.data, new_row], ignore_index=True)
        self.receptionist.release(request)   
            


class Attend:
    """
    A class used to represent an Attend process in a simulation environment.

    Attributes
    ----------
    attendance_counter : int
        a class variable shared by all instances, used to count the number of attendances
    env : simpy.Environment
        the simulation environment
    receptionist : simpy.Resource
        the receptionist resource

    Methods
    -------
    """
    @classmethod
    def reset(cls):
        cls.attendance_counter = 0
    
    def __init__(self, env, receptionist, doctor):
        self.env = env
        self.receptionist = receptionist
        self.doctor = doctor
        self.finished = self.env.event() # this is an event that can be waited for to finish the process
    # def attending(self):
    #     """
    #     Increments the attendance counter and logs the attend time.
    #     """
    #     while True:
    #         Attend.attendance_counter += 1 
    #         attend_time = self.env.now
    #         print(f"Attendee {Attend.attendance_counter} arriving at {attend_time}")
    #         if Attend.attendance_counter == 1:
    #             yield self.env.timeout(0.01)  # add a small delay for the first attendee - this is a fudge because I am not testing random times
    #         self.env.process(self.handle_attendance(attend_time))
    #         yield self.env.timeout(g.attend_interval)

    def handle_attendance(self, attend_time, run):
        """
        Handles an attendance, waits for `g.registration_duration` time units, and logs the attendance details.

        Parameters
        ----------
        attend_time : float
        the time the attendance was initiated

        Yields
        ------
        simpy.Timeout
        a timeout event that occurs after `g.registration_duration` time units
        """
        Attend.attendance_counter += 1
        logging.debug(f"Run {run}\t Attnd  {Attend.attendance_counter} arriving at {attend_time}")
        with self.receptionist.request() as request:
            logging.debug(f"Run {run}\t Attnd  {Attend.attendance_counter} started handle_attendance at {self.env.now}")
            yield request
            queue_time = self.env.now - attend_time
            g.queue_times_df = pd.concat([g.queue_times_df, pd.DataFrame.from_records([
                {'ID': Attend.attendance_counter
                , 'Run': run
                , 'Queue_Type': 'Reception'
                , 'Queue_Time': queue_time}])]
                , ignore_index=True
                )
            

            logging.debug(f"Run {run}\t Attnd  {Attend.attendance_counter}  attended at {attend_time}")
            logging.debug(f"Run {run}\t Attnd  {Attend.attendance_counter}  started registering at {self.env.now}")
            yield self.env.timeout(g.registration_duration)
            logging.debug(f"Run {run}\t Attnd  {Attend.attendance_counter} ended registration at {self.env.now}") # receptionist is done
        
        self.receptionist.release(request)    
        logging.debug(f"Run {run}\t Attnd  {Attend.attendance_counter} released receptionist at {self.env.now}")
        yield self.env.process(self.see_doctor(self.env.now, run)) # this is a process that is yielded to and so it can be waited for to finish
        logging.debug(f"Run {run}\t Attnd  {Attend.attendance_counter} finished handle_attendance at {self.env.now}")
    
    def see_doctor(self, ended_registration_time, run):
        with self.doctor.request() as request:
            yield request
            queue_time = self.env.now - ended_registration_time
            g.queue_times_df = pd.concat([g.queue_times_df, pd.DataFrame.from_records([
                {'ID': Attend.attendance_counter
                , 'Run': run
                , 'Queue_Type': 'Doctor'
                , 'Queue_Time': queue_time}])]
                , ignore_index=True
                )
            
            logging.debug(f"Run {run}\t Attnd  {Attend.attendance_counter}  ended registration at {ended_registration_time}")
            logging.debug(f"Run {run}\t Attnd  {Attend.attendance_counter}  started seeing GP at {self.env.now}")
            yield self.env.timeout(g.doctor_visit_duration)
            logging.debug(f"Run {run}\t Attnd  {Attend.attendance_counter} ended seeing GP at {self.env.now}")
        if True: #random.random() < g.test_chance:
            logging.debug(f" * Run {run}\t Attnd  {Attend.attendance_counter}  went to book test at {self.env.now}")
            yield self.env.process(self.book_test(self.env.now, run))
        self.finished_visit()

    def book_test(self, time_sent_for_test_booking, run):
        with self.receptionist.request() as request:
            logging.debug(f"Receptionist asked to book test at {self.env.now}")
            yield request
            queue_time = self.env.now - time_sent_for_test_booking  # time spent in queue
            g.queue_times_df = pd.concat([g.queue_times_df, pd.DataFrame.from_records([
                {'ID': Attend.attendance_counter
                , 'Run': run
                , 'Queue_Type': 'Booking_Test'
                , 'Queue_Time': queue_time}])]
                , ignore_index=True
                )
            logging.debug(f"Run {run}\t Attnd  {Attend.attendance_counter}  started booking test at {self.env.now}")
            yield self.env.timeout(g.test_booking_duration)
            logging.debug(f"Run {run}\t Attnd  {Attend.attendance_counter} ended booking test at {self.env.now}")
        self.receptionist.release(request)
        logging.debug(f"Run {run}\t Attnd  {Attend.attendance_counter}, receptionist finished booking test at {self.env.now}")



    def finished_visit(self):
        """
        Signals that the patient's visit is complete.
        """
        logging.debug(f"Run {run}\t Attnd  {Attend.attendance_counter} finished visit at {self.env.now}")
        if not self.finished.triggered:  
            self.finished.succeed()  # Trigger the 'finished' event

#############################################

def arrivals(env, receptionist, doctor, run):
    while True:
        attend = Attend(env, receptionist, doctor)
        env.process(attend.handle_attendance(env.now, run))
        yield env.timeout(g.attend_interval)





class SimulationRunner:
    def __init__(self):
        self.env = simpy.Environment()
        self.receptionist = simpy.Resource(self.env, capacity=g.receptionist_capacity)
        self.doctor = simpy.Resource(self.env, capacity=g.doctor_capacity)
        self.call = Call(self.env, self.receptionist)

    def run_simulation(self):
        for run in range(g.simulation_runs):
            Call.reset() # Reset the call counter for each run
            Attend.reset() # Reset the attendance counter for each run
            self.env = simpy.Environment()
            self.receptionist = simpy.Resource(self.env, capacity=g.receptionist_capacity)
            self.doctor = simpy.Resource(self.env, capacity=g.doctor_capacity)
            self.call = Call(self.env, self.receptionist)
            attend = Attend(self.env, self.receptionist, self.doctor)  # Create Attend object here
            Call.call_counter = 0
            Attend.attendance_counter = 0
            self.env.process(self.call.calling(run))
            self.env.process(arrivals(self.env, self.receptionist, self.doctor, run))
            self.env.run(until=g.duration)
        logging.debug(g.queue_times_df)

# Run the simulation
sim_runner = SimulationRunner()
sim_runner.run_simulation()


avg_wait_time = g.queue_times_df.groupby(['Run', 'Queue_Type'])['Queue_Time'].mean().reset_index()
max_wait_time = g.queue_times_df.groupby(['Run', 'Queue_Type'])['Queue_Time'].max().reset_index()

logging.debug(g.queue_times_df.to_string())

# Create bar plots
plt.figure(figsize=(10, 5))
sns.barplot(x='Run', y='Queue_Time', hue='Queue_Type', data=avg_wait_time)
plt.title('Average Wait Time for Each Queue Type and Run')
plt.show()

plt.figure(figsize=(10, 5))
sns.barplot(x='Run', y='Queue_Time', hue='Queue_Type', data=max_wait_time)
plt.title('Maximum Wait Time for Each Queue Type and Run')
plt.show()
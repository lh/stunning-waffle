

'''
In your groups, translate the following description into an object oriented framework.
You are setting up a model for a local trust that runs a number of different clinics.

To begin with, they’d like you to develop a proof of concept that models some of the functionality of weight loss clinics and sexual health clinics.

All of the organisation’s clinics have a clinic name and a list of staff who work there.
Any clinic can open or close (and the model will need to be able to record whether the clinic is open or closed),
and should have a means of displaying all the members of staff who work at the clinic.

Weight Loss Clinics also have a lead nurse, which should be recorded, and sometimes this person isn’t already on the staff list.
There should be a way to check if they are, and if they’re not, to add them.

Sexual Health Clinics have the facility to book tests in the clinic’s appointment book, which records a patient’s name against their appointment time.
You should also build in functionality to display the entries in the appointment book.

Once you’ve built the proof of concept described above, create a couple of new weight loss clinics - one in Cornwall, and one in Devon, with lists of staff, and a lead nurse.
Test the functionality of checking whether a given lead nurse is in the list of staff or not.
Also, create a sexual health clinic in Cornwall, and book in an appointment for Jessica Fletcher at 1100.
Check the functionality for displaying the appointment book too.

You have 50 minutes, and you should work together as a group on this task.
There is no single correct approach for this - this will also develop your skills in designing code for a purpose.
'''

#import pandas as pd

# Create the class of Clinic and give it a name and staff list
class Clinic:
    def __init__(self,clinic_name, staff_list):
        self.clinic_name = clinic_name
        self.is_open = False
        self.staff_list = staff_list
        
    def open_clinic(self):
        self.is_open = True
    
    #ignore the below until explanation#
    def __str__(self):
        return f"{self.clinic_name}, {self.staff_list}, {self.is_open}"

    def display_staff(self):
        print(f"The staff at {self.clinic_name} are: {self.staff_list}.")


class Weightloss_clinic(Clinic):
    def __init__(self,clinic_name, staff_list,lead_nurse):
        super().__init__(clinic_name, staff_list)
        self.lead_nurse = lead_nurse

    def check_lead_nurse(self):
        if self.lead_nurse in self.staff_list:
            print(f"The lead nurse - {self.lead_nurse} is in the staff list!")
        else:
            print(f"The lead nurse - {self.lead_nurse} will be added to the staff list!")
            self.staff_list.append(self.lead_nurse)
    

class Sexualhealth_clinic(Clinic):
    def __init__(self,clinic_name, staff_list):
        super().__init__(clinic_name, staff_list)

        #self.appointment_book = pd.DataFrame(data,columns=['Name','Appointment_time'])
        self.appointment_book = dict()

    def add_appointment(self):
        patient_name = input('Enter the patient name')
        appointment_datetime = input('Enter the date and time of appointment YYYY/MM/DD hh:mm')
        appointment = {appointment_datetime : patient_name}
        self.appointment_book.update(appointment)
        print(f'Appointment made for {patient_name} at {appointment_datetime}')

    def display_appointments(self):
        print(self.appointment_book)



clinic_1 = Weightloss_clinic("Cornwall Weight Loss Clinic",['Bob','Jane','John'],'Bob')
clinic_1.check_lead_nurse()


clinic_2 = Weightloss_clinic("Devon Diabetic Clinic")
clinic_3 = Sexualhealth_clinic("Cornwall Sexual Health Clinic",['Bob','Jane','John'])

clinic_3.add_appointment()



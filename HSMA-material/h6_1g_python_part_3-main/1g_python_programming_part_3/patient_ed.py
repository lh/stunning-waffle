import random



class Patient:
    def __init__(self, name, patient_id, age):
        self.name = name
        self.patient_id = patient_id
        self.cured = False
        self.age = age

    def attend_ed (self, mean_time):
        time_in_ed = random.expovariate(1/mean_time)
        print(f"Patient {self.name}, ID= {self.patient_id}"
        f" spent {time_in_ed:.2f} hours in ED")

        return time_in_ed

    def receive_treatment (self, prob_cure : float):
        if prob_cure > random.uniform(0,1):
            self.cured = True
            print(f"Yay, {self.name} was cured!")
        else:
            self.cured = False
            print(f"Sorry, cutbacks. {self.name} didn't make it")
    
    def ed_effect(self, mean_time):
        if self.attend_ed(mean_time) > 10:
            self.receive_treatment(.2)
        else:
            self.receive_treatment(.8)

my_patient = Patient("John", "123", "99")

# my_patient.attend_ed(10)

# my_patient.receive_treatment(0.5)

my_patient.ed_effect(10)

#i can edit









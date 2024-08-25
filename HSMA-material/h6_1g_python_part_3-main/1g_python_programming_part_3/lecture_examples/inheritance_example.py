
class Vehicle:
    def __init__(self, reg_number):
        self.reg_number = reg_number

    def drive(self, speed):
        print (f"Now driving at {speed}mph")

    def park(self, location):
        print (f"Now parked at {location}")

# We pass Vehicle into Ambulance.  This defines Vehicle as the parent, and
# Ambulance as the child.
class Ambulance(Vehicle):
    def __init__(self, reg_number):
        # This calls the constructor of the parent (super), and passes the reg
        # number across to it
        super().__init__(reg_number)

        self.patient_on_board = False
        self.siren_on = False

    # We don't need to redefine drive() and park() (unless we want to change
    # them for an ambulance) as we inherit them automatically.  So we just
    # define any methods unique to an ambulance.  (If we do want to change one
    # of the inherited methods, we just redefine them here, with the same name)
    def load_patient(self, patient_name):
        self.patient_on_board = True
        print (f"{patient_name} now on board")

    def unload_patient(self, patient_name):
        self.patient_on_board = False
        print (f"{patient_name} unloaded")

    def turn_on_siren(self):
        self.siren_on = True
        print ("Nee nor nee nor nee nor nee nor nee nor")

    def turn_off_siren(self):
        self.siren_on = False

class Bus(Vehicle):
    def __init__(self, reg_number, passenger_capacity):
        super().__init__(reg_number)
        self.passenger_capacity = passenger_capacity

    def open_doors(self):
        print ("Doors are open")

    def close_doors(self):
        print ("Doors are closed")

    def take_fare(self, fare_amount):
        print (f"Taken {fare_amount} as fare")

class Car(Vehicle):
    def __init__(self, reg_number, number_of_doors):
        super().__init__(reg_number)
        self.number_of_doors = number_of_doors

    def open_boot(self):
        print ("Boot is open")

    def close_boot(self):
        print ("Boot is closed")


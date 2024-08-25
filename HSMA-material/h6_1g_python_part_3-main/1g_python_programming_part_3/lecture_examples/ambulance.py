
class Ambulance:
    def __init__(self, name_of_trust, reg_number):
        self.name_of_trust = name_of_trust
        self.reg_number = reg_number

        self.patient_on_board = False
        self.siren_on = False

    def drive(self, speed):
        print (f"Now driving at {speed}mph")

    def park(self, location):
        print (f"Now parked at {location}")

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

dans_ambulance = Ambulance("Chalk NHS Trust", "CH41 LKS")

dans_ambulance.drive(50)
dans_ambulance.turn_on_siren()
dans_ambulance.park("Cake shop")

sammis_ambulance = Ambulance("Rosser Healthcare", "HS44 MAS")

sammis_ambulance.drive(70)
sammis_ambulance.turn_on_siren()
sammis_ambulance.park("M23 Junction 42")
sammis_ambulance.load_patient("Jack Shepherd")
sammis_ambulance.drive(70)
sammis_ambulance.park("Dharma Hospital")
sammis_ambulance.turn_off_siren()
sammis_ambulance.unload_patient("Jack Shepherd")


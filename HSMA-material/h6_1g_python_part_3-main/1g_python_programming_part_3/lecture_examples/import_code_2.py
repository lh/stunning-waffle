
# just import the turn_into_a_wizard function
from Penchord_Wizardry import turn_into_a_wizard

# Define a new class called HSMA, which has two attributes - a name, and an
# is_a_wizard boolean
class HSMA:
    def __init__(self, name):
        self.name = name
        self.is_a_wizard = False
        
# Create a new HSMA object, whose name is Gandalf
my_promising_HSMA = HSMA("Gandalf")

# Turn Gandalf into a wizard using the function we imported from the
# Penchord_Wizardry module
turn_into_a_wizard(my_promising_HSMA)


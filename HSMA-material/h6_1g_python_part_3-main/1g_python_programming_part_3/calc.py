#  Import packages
import numpy as np

# Define calculator class
class Integer_Calculator:
    def __init__(self, switched_on=False): #Added default value for switched on
        self.switched_on = switched_on #value from init
        
    def switch_on_calculator(self):
        self.switched_on = True #equivalency not assignment
        print ("Calculator is now turned on") #brackets added + True/false wrong way round for on/off
        
        #Added logo
        print(""
            ,"   █████████  █████                ████  █████     \n"
            ,"  ███░░░░░███░░███                ░░███ ░░███      \n"
            ," ███     ░░░  ░███████    ██████   ░███  ░███ █████\n"
            ,"░███          ░███░░███  ░░░░░███  ░███  ░███░░███ \n"
            ,"░███          ░███ ░███   ███████  ░███  ░██████░  \n"
            ,"░░███     ███ ░███ ░███  ███░░███  ░███  ░███░░███ \n"
            ," ░░█████████  ████ █████░░████████ █████ ████ █████\n"
            ,"  ░░░░░░░░░  ░░░░ ░░░░░  ░░░░░░░░ ░░░░░ ░░░░ ░░░░░ \n"
            ,"                                                   \n"
            ,"                                                   \n"
            ,"                                                   \n"
            ,"   █████████            ████                       \n"
            ,"  ███░░░░░███          ░░███                       \n"
            ," ███     ░░░   ██████   ░███   ██████              \n"
            ,"░███          ░░░░░███  ░███  ███░░███             \n"
            ,"░███           ███████  ░███ ░███ ░░░              \n"
            ,"░░███     ███ ███░░███  ░███ ░███  ███             \n"
            ," ░░█████████ ░░████████ █████░░██████              \n"
            ,"  ░░░░░░░░░   ░░░░░░░░ ░░░░░  ░░░░░░               ")

    def switch_off_calculator(self):
        self.switched_on = False #equivalency not assignment
        print ("Calculator is now turned off") #brackets added + True/false wrong way round for on/off

    # Adding function    
    def add_numbers(self, list_of_numbers): 
        result = sum(list_of_numbers) #list_of_numbers = list_of_integers

        return result #Added return result
    
    # Subtracting function
    def subtract_numbers(self,list_of_numbers):
        result = list_of_numbers[0]
        for x in range(1, len(list_of_numbers)):  #close bracket
            result -= list_of_numbers[x] # -= not =- ; number->x
            
        return result
    
    # Multiplying function
    def multiply_numbers(self, list_of_numbers):
        result = list_of_numbers[0]
        
        for x in range(1, len(list_of_numbers)): 
            result = result * list_of_numbers[x] # ** to *
            
        return result #changed to return the result instead of number
    
    # Dividing function
    def divide_numbers(self, list_of_numbers): #added self, list of numbers
        result = list_of_numbers[0]
        try:
            for x in range(1, len(list_of_numbers)):
                result = result / list_of_numbers[x]
        except:
            print("Did you try and divide by zero? Naughty, naughty!")
            result = np.NaN    
        return result   

    def test_me(self,anything):
        return anything

##LH version
    def input_numbers(self):
        if self.switched_on == False:
            print( "Calculator is switched off")
            return []
        else:
            list_of_inputs = []
            keep_inputting = True
            while keep_inputting:
                while True:
                    try:
                        input_number = int(input("Please input a whole number : "))
                        list_of_inputs.append(input_number)
                        break
                    except ValueError:
                        print(f"I'm sorry, that was not an integer.", 
                            f"try again:  "
                            )
                while True:        
                    try:
                        continue_decision = str(input("Continue (Y/N)? : ")).upper()    
                        if continue_decision == "Y":
                            break     # break out of the inner while True:
                        elif continue_decision == "N":
                            keep_inputting = False
                            break
                        else:
                            raise ValueError # need to create an error to catch
                    except ValueError:
                        print("You must input Y or N only")
            print(f'Your list of inputs is {list_of_inputs}') # added feedback
            return list_of_inputs    # careful with indentation
## end LH version

             
      
    def input_operator(self):
        if self.switched_on == False:
            print ("Calculator is switched off")
            
            return "ERR"
        else:                               # changed to else from except
            valid_operator = False
            
            while valid_operator == False:
                print ("Please input :\n" # single print function
					   ,"+ for addition\n"
					   ,"- for subtraction\n"
					   ,"* for multiplication\n"
					   ,"/ for division") 
                selected_operator = str(input ("SELECTION : ")) ## brackets added, removed int()
                
                if selected_operator in ["+", "-", "*", "/"]: # Changed == to in (item in list)
                    valid_operator = True
                    print(f'Your selected operator is "{selected_operator}"') #Added feedback
                    return selected_operator
                else:                           # else from elif
                    print ("Invalid operator")

    def run(self):
        self.switch_on_calculator()
        list_of_input_numbers = self.input_numbers()
        chosen_operator = self.input_operator()
        
        if len(list_of_input_numbers) > 1:
            if chosen_operator == "+":
                answer = my_calculator.add_numbers(list_of_input_numbers)
            elif chosen_operator == "-":
                answer = my_calculator.subtract_numbers(list_of_input_numbers)
            elif chosen_operator == "*":
                answer = my_calculator.multiply_numbers(list_of_input_numbers)
            elif chosen_operator == "/":
                answer = my_calculator.divide_numbers(list_of_input_numbers)
            else:
                print(("Error - calculator was switched off"))
            print(f"The answer is {answer}")
        else:
            print("Only one number given")

# Instantiate object                    
my_calculator = Integer_Calculator() #named object

my_calculator.run()

my_calculator.switch_off_calculator()


# my_calculator.switch_on_calculator() #turn_on_calculator() = switch_on_calculator(True)
# list_of_input_numbers = my_calculator.input_numbers() # defined return variable
# chosen_operator = my_calculator.input_operator() #defined return variable

# if len(list_of_input_numbers) > 1:  ## changed from < to >, numbers greater than 1
#     if chosen_operator == "+":
#         answer = my_calculator.add_numbers(list_of_input_numbers) # Added input numbers 
#     elif chosen_operator == "-":
#         answer = my_calculator.subtract_numbers(list_of_input_numbers) # Added input numbers 
#     elif chosen_operator == "*":
#         answer = my_calculator.multiply_numbers(list_of_input_numbers) # Added input numbers 
#     elif chosen_operator == "/":
#         answer = my_calculator.divide_numbers(list_of_input_numbers) # Added input numbers 
#     else:
#         print ("Error - calculator was switched off")
        
#     print (f"The answer is {answer}") #added f
# else:
#     print ("Only one number given")
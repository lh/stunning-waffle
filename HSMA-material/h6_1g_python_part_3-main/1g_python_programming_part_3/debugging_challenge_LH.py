
import numpy as np

class Integer_Calculator:
    def __init__(self):
        self.switched_on = False
        
    def switch_on_calculator(self):
        self.switched_on = True
        print("Calculator is now turned on\n")
        
    def switch_off_calculator(self):
        self.switched_on = False
        print("Calculator is now turned off\n")
        
    def add_numbers(self, list_of_numbers):
        result = sum(list_of_numbers)
        return result
    
    def subtract_numbers(self, list_of_numbers):
        result = list_of_numbers[0]
        
        for x in range(1, len(list_of_numbers)):
            result -= list_of_numbers[x]
            
        return result
    
    def multiply_numbers(self, list_of_numbers):
        result = list_of_numbers[0]
        
        for x in range(1, len(list_of_numbers)):
            result = result * list_of_numbers[x]
            
        return result
    
    def divide_numbers(self,list_of_numbers):
        result = list_of_numbers[0]
        try:
            for x in range(1, len(list_of_numbers)):
                result = result / list_of_numbers[x]
        except:
            print("Did you try and divide by zero? Naughty, naughty!")
            result = np.NaN    
        return result
    
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
            return list_of_inputs    # careful with indentation
                    
    def input_operator(self):
        if self.switched_on == False:
            print ("Calculator is switched off")
            return
        valid_operator = False
        while valid_operator == False:
            print ("Please input : ")
            print ("+ for addition")
            print ("- for subtraction")
            print ("* for multiplication")
            print ("/ for division")
            selected_operator = str(input("SELECTION : "))    
            if selected_operator in ["+", "-", "*", "/"]:
                valid_operator = True
                return selected_operator
            else:
                print("Invalid operator")
                    

my_calculator = Integer_Calculator()


my_calculator.switch_on_calculator()
list_of_input_numbers = my_calculator.input_numbers()
chosen_operator = my_calculator.input_operator()

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
        print("Error - calculator was switched off")
        
    print(f"The answer is {answer}")
else:
    print ("Only one number given")
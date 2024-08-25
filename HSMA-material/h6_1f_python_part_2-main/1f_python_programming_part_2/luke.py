import random
import numpy as np
import time

def rando(mean, st_dev, user):
    random_number = np.random.normal(mean, st_dev)
    while random_number <= 0 or random_number == user:
        random_number = np.random.normal(mean, st_dev)
    return random_number    

def closest(computer, user, actual):
    computer_error = abs(computer - actual)
    user_error = abs(user - actual)

    if computer_error < user_error:
        return computer
    else: 
        return user


user_try = int(float(input("How many seconds"
                " will it take Dan to reference a computer game: " )))

computer_try = rando(25, 10, user_try) 
start_time = time.time()
print(f"I'm guessing about {computer_try} seconds")


print("Tell you what, enter BINGO when you spot a reference")

bingo = ""
while bingo.lower() != "bingo":
    bingo = input()

# Stop the timer
end_time = time.time()

closer = closest(computer_try, user_try, end_time)

print(f"It took {end_time} seconds.")
print(f"You chose {user_try}; I chose {computer_try}")
print(f"The actual time was {end_time} so {closer} was nearest")

"""
When I was 4 years old, I wrote my very first program in BASIC on my Atari 800XL. 
In it, the computer randomly picked a whole number between 1 and 100, and the user 
had 10 chances to guess the number.  Every time the user guessed a number, they 
would be told either that the number was “too low”, “too high” or “correct”. If 
the user used up all 10 chances without guessing correctly, they were told “you
lose”, along with what the number was, and the game would end.

You’ve been taught enough to write this program in Python.  You should write the game 
above along with the following features that 4-year old Dan didn’t implement :
- a score, which starts at 1000 and which reduces by 100 for every unsuccessful guess, 
and which is displayed if the user wins
- the user’s guesses are stored in a list and printed once the game is over
- the game asks if the player wants to play again after every game ends
- after each game, the player’s score is checked against the current high-score 
(default is 0) and if the last score is higher than the recorded high score then 
this replaces the high score.

If you do all that with time to spare, add some bells and whistles of your choosing!
You have 40 minutes (+10 minute break), and you should work as a group, with one person
writing the code and sharing their screen, and everyone else contributing.
"""


import random
scores = {}
play = " "

while play != "end": 
    play = input("Enter end to stop:  ")
    print("This is a simple game,just predict if the next card is higher or lower")
    name = input("What is your name? ")
    



    if is_won == True:
        if name in scores:
        scores[name] += 1
        else:
        scores[name] = 1 # have to initialise a key: value pair otherwise += fails





print("The players and scores today were: {scores}")






    score = 1000
    target = random.randint(1, 100)
    guesses = []
    high_score = 0

    name = input("What is your name? ")
    while play == "yes":
        goes = 0
        guess = int(input(f"Hi {name}, enter your integer guess,1- 100:  "))
        while guess != target:
            guesses.append(guess)
            if guess > target:
                print("too high!")
            elif guess < target:
                print("too low")
            score -= 100    
            guess = int(input("Enter your integer guess, 1 - 100:  "))
            if len(guesses) >= 10:
                print("You lose")
                break
        print(f"Your score is {score} ")
        if score > high_score:
            scores[name] = score
            high_score = score
        print(f"current high score is {high_score}")
        print(f"The curent score table is {scores}")
        play = input("If {name} would like to play on, type \"yes\": ")


    
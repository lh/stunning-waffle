

"""
Today, you’ve learned the following Python concepts :

Printing to the display
Variables and casting
User inputs
Comments
Mathematical operators
Conditional Logic
For and While Loops
Working with Lists and List Comprehension
Dictionaries
Libraries / Packages and Imports
The Random Library

Your task now, in your groups, is to design and build a computer program that uses some 
or all of the concepts you’ve learned about today.  Your program can do anything you like
 - be as creative as possible!  You have 1 hour to design and build your program.  Each 
 group will then have 2 minutes to present their program, and Sammi will judge the best 
 one and nominate the top three groups for those all important PSG Points (15, 10 and 5)!
"""

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


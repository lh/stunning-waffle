c# Python in a day!

Python is not strongly typed. Assigning a new type will change the type of the variable. Yuck. 


## Variables that store Multiple Items

Lists (list) are sequences of items, where the order matters.  Duplicates allowed. 
```python
[a,B,3,"hello"]
```
Sets (set) are unordered sequences of unique items.
```python
{1,11,7,5,9,3} 
```
Tuples (tuple) are ordered sequences (like a list) but are immutable (once created, they cannot be changed)

```python
("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
```
Dictionaries (dict) are unordered collections of key-value pairs

```python
{"Monday": "1", "Tuesday": "2", "Friday": "5"}
```

##  Forcing type

Use a function to cast type, eg
```python
age = int(input("How old are you? : "))

````
But there are gotchas. It will round a float to an int but it won't round a number expressed as a string.

## Operators

Mainly obvious. 

    % is modulus (ie a%b is remainder of a/b)
    ** is power 
    += 1 is increment by 1
    -= 2 is decrement by 2


## Controlling flow; conditional logic

```python
if age < 60:
    print ("Please go to room A")
else:
    print ("The humane killer for you!")

```

Note the tab indentation, 4 spaces, is meaningful and is essentially an opening curly bracket. 

If there is an "else" you need to do something...

Multiple sequential ifs use elif:

```python
if age < 16:
    print ("Please go the the children's area")
elif age < 60:
    print ("Please go to room A")
else:
    print ("Please go to room B")
```

if and elif need boolean inputs

## Boolean operators

    ==
    !=
    >
    <
    >=
    <=
    or
    and
    ^ (xor)

## Formatting numbers in strings

float:.2f will print 2 decimal places. 


## Loops and whiles

### for 

```python
for x in range(10):     # range gives an iterable object size n, starts zero 
                        # and ends at n-1
    print(x)
```
sometimes the start and end are important

```python
for x in range(10, 20):     # range gives an iterable object size 10, starts 10 
                            # and ends at 20-1
    print(x)
```

```python
for x in range(10, 20, 2):      # range gives an iterable object size 10, 
                                # starts 10 
                                # and ends at 20-1 moves in incremenst of 2
    print(x)
```

Can use the increment to decrement

```python
for x in range(10, 0, -1):  # range gives an iterable object size 10,
                            # starts 10 
                            # and ends at 0 + 1
    print(x)
```

Can iterate over a list

```python
my_list = [a,B,3,"hello"]

for element in my_list;     # "element" is an arbitray temporary? variable. 
    print(element)
```

### while

```python
while correct == false:
    if answer == YES
        print("yes!")
        correct = TRUE    
    else print("noooo")
```
infinite loop. 
```
while True:
    print("")
```

### break
can break out of a for loop or a while loop with a break statement. 


## lists

These are useful and used a lot. Square brackets define a list. 

```python
my_empty_list = []

```

## dot notation

Can be used to chain a method when the object has methods

so:
```python
my_list = [3, 4, 6, "hello"]

my_list.append(2)
```

This puts the append method on the my_list object.. It only works if the object is the right
type. 

lists are ordered - can be accessed by their _index_. 

so
```python
my_list[x]
```
supplies the position x. Note that the first index is zero (0). 

### slices
A slice of an index gives a range inclusive of the first index and exclusive of the last. 
eg 
```python
mylist[2:4]     #from 2 up to an not including 4
mylist[:2]      # from the start up to not including 2
mylist[3:]      # from 3 inclusive tot he end of the list
```
### negative index
-1 is the last index, -2 the one before 

to find the length of any iterable object

```
len(mylist)
```

There is a method .remove

```python 
mylist.remove("Value")
```

or by giving index
```python
mylist.pop removes the last element
```
mylist.pop(2) removes index 2

### push

There is no push to correspond with pop for lists; use .append():
```python
# Create a list
my_list = [1, 2, 3]

# Add a number to the list
my_list.append(4)

# Print the list
print(my_list)
```

### in statements
in can be used for iterable things

```python 
if 2 in my_list:
``` 
    do something

can be used with negatives
```python
if 2 not in my_list
```    
do something else

```python
my_list = [3, 4, 7, "hello", 2]

copy_of_my_list = my_list  # just passes a pointer

my_list = [3, 4, 7, "hello", 2]

copy_of_my_list = my_list.copy() # passes a new list
```

## List comprehension - Dan loves these bits of syntactic sugar

```python
list_a = [1,2,3,4,5]
list_b = []
list_b = [number*2 for number in list_a]

list_a = [1,2,3,4,5,6,7,8,9,10]
list_b = [num for num in list_a if num % 2 == 0]
```

## Dictionaries
Store as key: value pairs
order is not defined. 

```python
patient_dictionary = {  "patient_id":   13532, 
                        "name":         "Bob", 
                        "year_of_birth": 1961, 
                        "month_of_birth": 12
}

patient_dictionary[name] # returns "Bob"
patient_dictionary[name] = "John" 
patient_dictionary[name] # returns "John"

del patient_dictionary["month_of_birth"] # deletes month of birth
```

## Importing packages

```python
import string
import matplotlib.pyplot as plt
from wordcloud import WordCloud, STOPWORDS
```

There are some standard aliases, eg plt for 
matplotlib.pyplot

```python
import pandas
import numpy
```

```python
import random

random.random() # random number
random.random(1, 10) # random number 1 to 10 inclusive!
rqandom.randint(1, 10) # integer

random.choice(my_list) random from a list. 



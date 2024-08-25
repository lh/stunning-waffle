# Python: Classes

Classes in Python are used to create user-defined data structures. 
They define functions called methods, which identify the behaviours and actions 
that an object created from the class can perform with its data.

Here's a breakdown of the class structure in your code:

## Creating a Class: 
You create a class using the class keyword, followed by the 
name of the class and a colon. In your code, ```MyClass``` is being defined.
```python
class MyClass:
```
## Defining Methods: 
Inside the class, you can define methods. Methods are a kind
 of function that are defined within a class and are used to perform operations 
 that sometimes utilize the attributes of the class. In your 
 code, ```method_1``` and ```method_2``` are methods.
```python
def method_1(self):
    print ("This is method 1!")

def method_2(self):
    print ("This is method 2!")
```
## The ```__init__``` Method:
 This special method is called a constructor and is 
called when you create a new object from a class. It can accept arguments when 
needed to initialize the object's attributes.
```python
def __init__(self, attribute_1, attribute_2):
    self.attribute_1 = attribute_1
    self.attribute_2 = attribute_2
```

__ is a dunder metheod (double underscore) also known as a magic method. 
## Creating an Object (Instantiating a Class): 
To create an object (an instance of a class), you call the class using its name 
and pass in whatever arguments its ```__init__``` method accepts.
 ```python
my_object = MyClass("value1", "value2")
 ```

The ```self``` keyword is used in all definitions of methods and is counted in
 the input numbers, BUT in calling methods in code we don't explicitly pass 
 ```self``` (but python does). 

## Calling Methods: 
After you've created an object from the class, you can use dot
 notation to call any method on the object. Don't forget the ```()```!
 ```python
my_object.method_1()
my_object.method_2()
 ```
In this case, calling ```method_1``` will print "This is method 1!", and calling 
```method_2``` will print "This is method 2!".

## Accessing and modifying attributes
Access and modify the attributes of an object created from a class in Python 
using dot notation. 
```python
# Instantiate the class
my_object = MyClass("value1", "value2")

# Access the attributes
print(my_object.attribute_1)  # Outputs: value1
print(my_object.attribute_2)  # Outputs: value2

# Modify the attributes
my_object.attribute_1 = "new value1"
my_object.attribute_2 = "new value2"

# Verify the modification
print(my_object.attribute_1)  # Outputs: new value1
print(my_object.attribute_2)  # Outputs: new value2
```

## Inheritance

A new class can be derived from a parent class. Using ```MyClass```:
```python
class ChildClass(MyClass): 
```
would just clone ```MyClass```. However, we can extend or change the definition. 

Here's a simple example of inheritance:
```python
class ParentClass:
    def method1(self):
        print("This is from the parent class")

class ChildClass(ParentClass):
    def method2(self):
        print("This is from the child class")
```
In this example, ```ChildClass``` is inheriting from ``ParentClass``. This means that ```ChildClass``` has access to all methods of ```ParentClass```.

The ```super()``` function is used to call a method from the parent class. This is especially useful in the context of overriding methods, where you want to use the version of a method that exists in the parent class, in addition to adding some new functionality in your child class.

Here's an example of how you can use``` super()```:
```python
class ParentClass:
    def method1(self):
        print("This is from the parent class")

class ChildClass(ParentClass):
    def method1(self):
        print("This is from the child class")
        super().method1()
```
In this example, ```ChildClass``` overrides method1 from ```ParentClass```. Inside method1 of ```ChildClass```, we use super().method1() to call method1 from ```ParentClass```. So, when you call method1 on an instance of ```ChildClass```, it will first print "This is from the child class", then call ```method1``` from ```ParentClass```, printing "This is from the parent class".

## ```super().__init__()```
This is an important pattern in initiating a child class. In the file _inheritance_axample.py_,  ```super().__init__()``` is used to call the constructor of the parent class. This is typically used in the constructor of a child class.

Vehicle is the parent class and Ambulance is a child class. Ambulance has its own ```__init__``` methods (constructors), which is used to initialize new instances.
```python

class Vehicle:
    def __init__(self, reg_number):
        self.reg_number = reg_number

    def drive(self, speed):
        print (f"Now driving at {speed}mph")

    def park(self, location):
        print (f"Now parked at {location}")


class Ambulance(Vehicle):
    def __init__(self, reg_number):
        
        super().__init__(reg_number)

        self.patient_on_board = False
        self.siren_on = False

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

```
When you create a new Ambulance you want to do everything that's done when a new Vehicle is created, plus some additional things. That's why you call ```super().__init__(reg_number)``` in the constructors of Ambulance. This line calls the constructor of Vehicle, passing the reg_number argument to it.

After calling super().```__init__(reg_number)```, the Ambulance constructor also initializes self.patient_on_board and self.siren_on. These are attributes that are specific to Ambulance and are not part of Vehicle.

So, ```super().__init__()``` is a way to ensure that the initialization that's done in the parent class is not skipped when creating an instance of a child class.

We can similarly create more children of ```Vehicle``` that take nothing from ```Ambulance```:
```python

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


```

## Designing classes with the principle of least privilege in mind.

If I wanted a new class of Bus that doesn't take fares I would have a problem, because it is not possible to hide a method on a child class. So __(don't do this!)__
```python
# Smelly code warning
class SchoolBus(Bus):
    def __init__(self, reg_number, passenger_capacity):
        super().__init__(reg_number, passenger_capacity)

    def take_fare(self, fare_amount):
        raise NotImplementedError("This method is not available for SchoolBus")
```
It is messy! Better is to redefine Bus to have the superset of attributes which would not include taking fares, then have ```FareTakingBus``` and a ```SchoolBus``` as children of that. 

```python

class Vehicle:
    def __init__(self, reg_number):
        self.reg_number = reg_number

    def drive(self, speed):
        print (f"Now driving at {speed}mph")

    def park(self, location):
        print (f"Now parked at {location}")

class Bus(Vehicle):
    def __init__(self, reg_number, passenger_capacity):
        super().__init__(reg_number)
        self.passenger_capacity = passenger_capacity

    def open_doors(self):
        print ("Doors are open")

    def close_doors(self):
        print ("Doors are closed")

class FareTakingBus(Bus):
    def __init__(self, reg_number, passenger_capacity):
        super().__init__(reg_number, passenger_capacity)

    def take_fare(self, fare_amount):
        print (f"Taken {fare_amount} as fare")

class SchoolBus(Bus):
    def __init__(self, reg_number, passenger_capacity):
        super().__init__(reg_number, passenger_capacity)
```

# ```matlmatplotlib```
This is a library that apes matlab
```python
import matplotlib.pyplot as plt
```

It has a pretty gnarly syntax imho. 

```python
# Data to plot
x = [1,2,3,4,5,6,7,8,9,10]
y = [3,7,2,1,4,8,1,2,3,12]

# Create a figure object and an axes object, and add the axes object as a
# subplot of the figure object
figure_1, ax = plt.subplots()

# Set x axis and y axis labels
ax.set_xlabel('Time')
ax.set_ylabel('Number of patients')

# Plot our data (x and y here)
ax.plot(x, y)
```
NB ax is short for axes: it stands for a subfigure essentially, as opposed to a figure which is the containing object. 

From the man files:

matplotlib.pyplot is a state-based interface to matplotlib. It provides an implicit, MATLAB-like, way of plotting. It also opens figures on your screen, and acts as the figure GUI manager.

pyplot is mainly intended for interactive plots and simple cases of programmatic plot generation:

```python
import numpy as np
import matplotlib.pyplot as plt

x = np.arange(0, 5, 0.1)
y = np.sin(x)
plt.plot(x, y)
```
The explicit object-oriented API is recommended for complex plots, though pyplot is still usually used to create the figure and often the axes in the figure. See .pyplot.figure, .pyplot.subplots, and .pyplot.subplot_mosaic to create figures, and Axes API for the plotting methods on an Axes:
```python
import numpy as np
import matplotlib.pyplot as plt
x = np.arange(0, 5, 0.1)
y = np.sin(x)
fig, ax = plt.subplots()
ax.plot(x, y)
```
See api_interfaces for an explanation of the tradeoffs between the implicit and explicit interfaces.

When running in a terminal (outside interactive environment) need to 
explicitly call ```plt.show()``` to get some output. It is always "plt".

```python
import numpy as np
import matplotlib.pyplot as plt
x = np.arange(0, 5, 0.1)
y = np.sin(x)
fig, ax = plt.subplots()
ax.plot(x, y)

plt.show()
```

Running interactively, ```plt.show()``` is redundant. 

## Styles in matplotlib

There are different style packages available, e.g.:
```python
from matplotlib import pyplot as plt
plt.style.use('ggplot')
```
## linestyles
```python
import matplotlib.pyplot as plt
import numpy as np

ypoints = np.array([3, 8, 1, 10])

plt.plot(ypoints, linestyle = 'dotted')
plt.show() 
```
```linestyle``` can be shortened to ```ls```
| Style         | Or   |
|---------------|------|
| 'solid'       | -  |
| 'dotted'      | :  |
| 'dashed'      | -- |
| 'dashdot'     | -. |
| 'None'        | \" or ' |


## Marker styles
```python
import matplotlib.pyplot as plt
import numpy as np

ypoints = np.array([3, 8, 1, 10])

plt.plot(ypoints, marker = 'o')
plt.show()
```

| Symbol | Description |
|--------|-------------|
|','     |	Pixel |
| 'x'    | X           |
| 'X'    | X (filled)  |
| '+'    | Plus        |
| 'P'    | Plus (filled) |
| 's'    | Square      |
| 'D'    | Diamond     |
| 'd'    | Diamond (thin) |
| 'p'    | Pentagon    |
| 'H'    | Hexagon     |
| 'h'    | Hexagon     |
| 'v'    | Triangle Down |
| '^'    | Triangle Up |
| '<'    | Triangle Left |
| '>'    | Triangle Right |
| '1'    | Tri Down    |
| '2'    | Tri Up      |
| '3'    | Tri Left    |
| '4'    | Tri Right   |
| '\|'   | Vline       |
| '_'    | Hline       |

## Missing data

Indicating missing data by NaN is OK; matplotlib just misses them. This is useful if you have two series you are plotting on one graph: normally the series would have to have the same length. 

Use ```np.nan``` as the NaN. 

## Legends

Take this example without a legend:

```python
ax.plot(time, patients, color="blue", linestyle="-") # Plot patients over time
ax.plot(time, doctors, color="red", linestyle=":") # Plot doctors over time
```

We need to identify the labels for each plotted item, and then put them on the chart:

```python
ax.plot(time, patients, color="blue", linestyle="-", label="Patients") # Plot patients over time
ax.plot(time, doctors, color="red", linestyle=":", label="Doctors") # Plot doctors over time

```
and also then put the caption on:

```python
ax.plot(time, patients, color="blue", linestyle="-", label="Patients") # Plot patients over time
ax.plot(time, doctors, color="red", linestyle=":", label="Doctors") # Plot doctors over time

ax.legend(loc="upper left")
```



# Python: functions

named with lower case (capitals reserved for Classes)

function pattern:

```python 
def multiply_and_check(number_1, number_2): 
    % number_1 etc only comes into scope
    % within the function

    result = number_1 * number_2

    if result > 100:
        return True
    else:
        return False
```

You can return more than one output from a function, not in a list (yuck!).

eg ...
```python
def silly_function():    
    return "first", "second", "third"

eeny, meanie, minie = silly_function()   

print(meanie)
% -> second
```



## Scope
Global variables are anything defined outside a function. They can be referenced anywhere and they _can_ be altered within a function by using the __Global__ keyword. But don't!



# Python: handling errors

There is a common pattern on e.g. user input:
```python

    try: 
        age = int(float(input("How old are you? "))) # always runs
        break # only gets here if no error - goes to "finally:"
    except ValueError: # only if there is an error
# this is what to do if there is an error
        print(
            f"I'm sorry, that was not a valid answer. Please enter your", 
            f"age in years as a number: "
            )
        continue # this says can go back to the "while" but first do:
    finally: # this code always runs before restarting the "while"
        print("This is a great little app!")

```

This is the basic pattern but often held in a while loop. 
- try: (do something) 
- except: (if there is an error do this)
- else: do if no errors happened 
- finally: do this whatever


# Numpy

## useful for large multidimensional arrays
### Machine Learning _conditio sine qua non_

Numpy arrays are __homogenous__, you can only store the same type.
They only store floats or ints

An array has to have all sites filled. 

All the routines for handling arrays quickly live here. 

Some examples of array creation:
### Create a 1D array from a list
```python
list1 = [1, 2, 3, 4, 5]
array1 = np.array(list1)
print(array1)
```
### Create a 2D array from a list of lists
```python
list2 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
array2 = np.array(list2)
print(array2)
array6 = np.linspace(0, 1, 5)
print(array6)
```
### Create an array with values from 0 to 9
```python
array3 = np.arange(10)
print(array3)
```
### Create a 1D array of zeros
```python
array4 = np.zeros(5)
print(array4)
```
### Create a 2D array of ones
```python
array5 = np.ones((3, 3))
print(array5)
```

### Create an array with 5 values evenly spaced between 0 and 1
```python
array6 = np.linspace(0, 1, 5)
print(array6)
```

### Create a 3x3 identity matrix
```python
array7 = np.eye(3)
print(array7)
```

### Create a 1D array with 5 random values from a uniform distribution
```python
array8 = np.random.rand(5)
print(array8)
```
### Create a 2D array with random values from the standard normal distribution
```python
array9 = np.random.randn(3, 3)
print(array9)
```
### Create odd or even arrays
```python
evens = np.arange(2, 31, 2)
odds = np.arange(1, 31, 2)
print(evens)
print(odds)
```

## Referencing numpy arrays: 
[0] is the first group
[0][1] is the second item(or group) in the first group 
[0][0][1] second in the first of the first 

Within the [] use list notation eg [:] means everything in a list
[:n] is 0 to n-1

## Operations on arrays

can just use maths operators like * + - /

can specify in the notation which to apply to 

array[:2] * 2 would multiply all third lists by 3.


dot product np.dot(array_a, array_b) multiply each by its same place and sum the result

Dot Product calculations are useful when we want to weight one set of values by another set of values.  For example, in a geographic model, we may want to weight travel times by the number of people coming from a location (so that we don’t treat 1 person having to travel a longer distance the same way as 100 people having to do this).

np.unique(array) will remove any repeated values
can define axis (0 is the first axis, 1 the second etc)

can interrogate an array with array.shape gives you dimension 1,2,3
(ie axis 0,1,2)

array.ndim tells you how many axes - dimensions - it has. 

# Reading .csv files
Can use 
```python
import csv

list_of_names = []
list_of_ages = []

with open("filename.csv", "r") as f:
# with means the following code block is in this context
#                              as f is assigning an alias
```

#### f = open("foo"): 
This opens the file "foo" and assigns the file object to f. However, it does not automatically close the file when you're done with it. You would need to manually close the file using f.close() when you're done with it. If you forget to do this, the file stays open, which can lead to issues with file locks or consume system resources.

#### open("bar") as f: 
This is a context management statement that opens the file "bar" and assigns the file object to f. The advantage of this approach is that it automatically closes the file when the with block is exited, even if an exception occurs within the block. This makes it a safer way to handle files and is considered good practice.

## Reading csv
```python
import csv # import the csv library

# Set up two empty lists - one to store names, one to store ages
list_of_names = []
list_of_ages = []

# do the following block of code holding the csv file open in "read only" mode
# ("r"), and henceforth we'll refer to this file opened in read only mode as f
# (alias)
with open("filename.csv", "r") as f:
    # Create a csv reader object (we'll come back to that in Object Oriented
    # Programming), which uses the file opened in read-only mode (f), and where
    # the delimiter is a comma
    reader = csv.reader(f, delimiter=",")

    # For each row it reads in, take the first value before a comma and add it
    # to the list of names, and take the second value, and add it to the list
    # of ages.
    for row in reader:
        list_of_names.append(row[0])
        list_of_ages.append(row[1])



```

## Writing csv
```python
import csv # import the csv library

# Here's a list of column titles
list_of_column_titles = ["Name", "ID"]

# Here's a few lists containing data we want to write out to file
data_row_1 = ["Dan", 43102]
data_row_2 = ["Sammi", 31023]
data_row_3 = ["Amy", 54098]

# Let's combine the data rows into a single list of lists
combined_data = [data_row_1, data_row_2, data_row_3]

# Do the following block of code with output.csv opened in write mode ("w"),
# and setting the newline parameter to null (this is a necessary inclusion on
# Windows, otherwise it'll add an extra line between lines), and refer to it as
# f
with open("output.csv", "w", newline='') as f:
    # Create a csv writer object, which uses f (the file opened in write mode
    # etc) with a comma delimiter
    writer = csv.writer(f, delimiter=",")

    # Write the first row (the column titles)
    writer.writerow(list_of_column_titles)

    # Loop through the other data rows and write them (one on each line)
    for data_row in combined_data:
        writer.writerow(data_row)



```

#### Note file modes:
- "r" read only from the start
- "w" write only from the start
- "w+" read and write form the start
- "a" add to the end of the file


# Timing code

```python
%timeit np.sum(numpy_array)
```


# Pandas

```python
import pandas as pd
```

Mainly for managing dataframes. 

Also manages csv files easily 

```python
df = pd.read_csv("input_data.csv")
```
It adds an index column to the left as the unique 
identifier. 
 
You can specify a unique id
```python
df = pd.read_csv("input_data.csv", index_col="Patient ID")
```
The index is always passed back with a result

#### Retrieve a given column (note the index is always returned too) :
```python
df["Name"]
```

#### select rows
```python 
df.loc[index]
``` 
accesses specific row(s)

#### concatenation
```python
df_c = pd.concat([df_a, df_b], axis = 0)
```
but take care if the index is identical as it will 
retain duplicated indices!

#### dropping columns 
```python
df = df.drop(["Name"], axis =1)
# or
df.drop(["Name"], axis =1, inplace = True)
```

#### simple counting
```python
df["Flu Vaccine"].value_counts()
```
will give a summary count (ie yes = n, no = n)


#### pivot tables
```python
pivot_age_by_county = pd.pivot_table(data=df, 
index="County", 
values="Age",
aggfunc="mean")
```

#####  Can add more values, pass as a list [] eg:
```python
pivot_age_by_county = pd.pivot_table(data=df, 
index="County", 
values=["Age", "Number of admissions"],
aggfunc="mean")
```

### drop duplicates

```python
no_dup_admissions_df = admissions_df.drop_duplicates()
# this keeps the first instance
no_dup_admissions_df = admissions_df.drop_duplicates(keep='last')
#keeps the last entry
no_dup_admissions_df = admissions_df.drop_duplicates(keep=False)
# this drops ALL duplicates!
```

## pandas sorting
Automatically sorted by index

```python
df = df.sort_values(by = ["Age"], inplace = True)
```

## Joining dataframes
<https://pandas.pydata.org/docs/user_guide/merging.html>

## locating .loc function

Use .loc when:

You want guaranteed label-based indexing for clarity and safety.
You need to access data by row label or index position explicitly.
Use square brackets with caution when:
You're confident your labels are unique and won't be confused with integer positions.
You're familiar with the potential ambiguity of integer-based indexing.

### more on .loc as I find it confusing (from stackoverflow)

Explicit is better than implicit.

```df[boolean_mask]``` selects rows where boolean_mask is True, but there is a corner case when you might not want it to: when df has boolean-valued column labels:

```python
In [229]: 
df = pd.DataFrame({True:[1,2,3],False:[3,4,5]}); 
df
Out[229]: 
   False  True 
0      3      1
1      4      2
2      5      3
```
You might want to use ```df[[True]]``` to select the True column. Instead it raises a ValueError:


```python
In [230]: df[[True]]
ValueError: Item wrong length 1 instead of 3.
Versus using loc:
```
```python
In [231]: df.loc[[True]]
Out[231]: 
   False  True 
0      3      1
```
In contrast, the following does not raise ValueError even though the structure of df2 is almost the same as df1 above:


```python
In [258]: df2 = pd.DataFrame({'A':[1,2,3],'B':[3,4,5]}); df2
Out[258]: 
   A  B
0  1  3
1  2  4
2  3  5
```

```python
In [259]: df2[['B']]
Out[259]: 
   B
0  3
1  4
2  5
```

Thus, df[boolean_mask] does not always behave the same as df.loc[boolean_mask]. Even though this is arguably an unlikely use case, I would recommend always using df.loc[boolean_mask] instead of df[boolean_mask] because the meaning of df.loc's syntax is explicit. With df.loc[indexer] you know automatically that df.loc is selecting rows. In contrast, it is not clear if df[indexer] will select rows or columns (or raise ValueError) without knowing details about indexer and df.

df.loc[row_indexer, column_index] can select rows and columns. df[indexer] can only select rows or columns depending on the type of values in indexer and the type of column values df has (again, are they boolean?).
```python
In [237]: df2.loc[[True,False,True], 'B']
Out[237]: 
0    3
2    5
```

Name: B, dtype: int64
When a slice is passed to df.loc the end-points are included in the range. When a slice is passed to df[...], the slice is interpreted as a half-open interval:

```python
In [239]: df2.loc[1:2]
Out[239]: 
   A  B
1  2  4
2  3  5

In [271]: df2[1:2]
Out[271]: 
   A  B
1  2  4
```
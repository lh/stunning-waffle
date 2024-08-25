import os
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

plt.style.use('_mpl-gallery')





plt.show()
os.chdir("/home/luke/Documents/HSMA/h6_1g_python_part_3-main/1g_python_programming_part_3/")

df = pd.read_csv("meds_used_per_day.csv")

print(df)
print(df.head())
print(df.tail())
print(df.describe())
print(df.info())
print(df.columns)
print(df["Run 1"])

y1 = df["Run 1"]
y2 = df["Run 2"]
y3 = df["Run 3"]

# make data:
x1 = 0.5 + np.arange(len(df))
x2 = x1 + 1/4
x3 = x2 + 1/4

 
bar_width = 1/3

# plot


# ax.bar(x, y1,  edgecolor="white", linewidth=0.7)

# ax.set(xlim=(0, 8), xticks=np.arange(1, len(df)),
 #       ylim=(0, 8), yticks=np.arange(1, len(df)))

# Create a figure object and an axes object, and add the axes object as a
# subplot of the figure object
figure_1, ax = plt.subplots()

# Set x axis and y axis labels
# Plot our data (x and y here)
# ax.bar(x1, y1, width=bar_width)
# ax.bar(x2, y2, width=bar_width, color = "r")
# ax.bar(x3, y3, width=bar_width, color = "g")

ax.hist(y1, 
        bins=4, 
        width=bar_width,
        linewidth=0.5, 
        # edgecolor="white"
        )
ax.hist(y2, bins=4, 
        width=bar_width,
        linewidth=0.5, 
        # edgecolor="white",  
        color = "r"
        )
ax.hist(y3, bins=4, 
        width=bar_width,
        linewidth=0.5, 
        # edgecolor="white",  
        color = "g"
        )

plt.show


import matplotlib.pyplot as plt # provides matlab-style plotting interface

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

# Show the figure
figure_1.show()



import matplotlib.pyplot as plt # provides matlab-style plotting interface

# Data to plot
hsma_trainers = ["Dan", "Sammi", "Amy"]
hours_of_teaching = [96, 54, 6]

figure_1, ax = plt.subplots()

ax.set_xlabel("Trainer")
ax.set_ylabel("Hours of Teaching on HSMA")

ax.bar(hsma_trainers, hours_of_teaching)

figure_1.show()


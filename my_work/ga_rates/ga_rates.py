import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

datafile = 'my_work/ga_rates/data/anonymized_data.xlsx'

data = pd.read_excel(datafile)

print(data.head())
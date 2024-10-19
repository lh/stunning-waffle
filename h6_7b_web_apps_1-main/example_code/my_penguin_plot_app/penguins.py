import streamlit as st
import pandas as pd
import palmerpenguins as penguins
import matplotlib.pyplot as plt
from datetime import datetime

penguins_df = penguins.load_penguins()
st.write(penguins_df)

fig, ax = plt.subplots()

plt.scatter(penguins_df["bill_length_mm"], 
            penguins_df["bill_depth_mm"]
            )

st.pyplot(fig)
plt.savefig("penguin_plot.png")


with open("penguin_plot.png", "rb") as img:
    current_date = datetime.now().strftime("%Y-%m-%d")
    btn =st.download_button(
        label="Download image",
        data=img,
        file_name=f"{current_date}-penguin_plot.png",
        mime="image/png"
    )


import streamlit as st
import pandas as pd
import palmerpenguins as penguins
import matplotlib.pyplot as plt
import plotly.express as px

st.set_page_config(page_title="Palmer Penguins", page_icon="🐧", layout="wide" )

st.title("Palmer Penguins")
penguins.df = penguins.load_penguins()

with st.expander("Show Data"):
    st.write(penguins.df)
    st.image("/Users/rose/HSMA/h6_7b_web_apps_1-main/example_code/penguin.jpg", 
             width=200)

st.divider()

col_1, col_2 = st.columns(2)
with col_1:
    st.subheader("Penguin Species")
    penguin_species = penguins.df["species"].unique()
    penguin_species_selected = st.multiselect("Select Species", penguin_species)
    penguins.df = penguins.df[penguins.df["species"].isin(penguin_species_selected)]
    st.write(penguins.df)

with col_2:
    penguin_scatter = px.scatter(penguins.df, 
                                 x="bill_length_mm", 
                                 y="bill_depth_mm",     
                                 color="species")
    st.plotly_chart(penguin_scatter)
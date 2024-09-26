import pandas as pd
import plotly.express as px
import geopandas
import matplotlib.pyplot as plt
import streamlit as st
import numpy as np

#New attempt at he olympics streamlit app, taking a more tidy approach

# Load data with error handling

def load_data(file_path):
    try:
        data = pd.read_csv(file_path)
        return data
    except FileNotFoundError:
        st.error(f"Error: The file {file_path} was not found.")
    except pd.errors.EmptyDataError:
        st.error(f"Error: The file {file_path} is empty.")
    except pd.errors.ParserError:
        st.error(f"Error: Unable to parse the file {file_path}. Please ensure it's a valid CSV.")
    except Exception as e:
        st.error(f"An unexpected error occurred while loading {file_path}: {str(e)}")
    return None

# Load the datasets
medals_per_country_per_year = load_data("medals_per_country_per_year.csv")
country_medals_by_event = load_data("country_medals_by_event.csv")

# Check if data was loaded successfully
if medals_per_country_per_year is not None and country_medals_by_event is not None:
    st.success("Data loaded successfully!")
    
    # Display basic information about the datasets
    st.write("Medals per country per year shape:", medals_per_country_per_year.shape)
    st.write("Country medals by event shape:", country_medals_by_event.shape)
    
    # Display the first few rows of each dataset
    st.subheader("Medals per country per year (first few rows):")
    st.write(medals_per_country_per_year.head())
    
    st.subheader("Country medals by event (first few rows):")
    st.write(country_medals_by_event.head())
else:
    st.error("Failed to load one or both datasets. Please check the error messages above.")


import streamlit as st

def load_css(file_name):
    with open(file_name) as f:
        st.markdown(f'<style>{f.read()}</style>', unsafe_allow_html=True)

# Example usage in your Streamlit pages:
# In each page file (e.g., page1.py, page2.py, etc.)
from utils import load_css

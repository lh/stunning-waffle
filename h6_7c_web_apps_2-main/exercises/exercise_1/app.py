import streamlit as st
from utils import load_css

load_css("style.css")

st.title('Hello, HSMA')

pg = st.navigation([
    st.Page("home.py", title="Home"),
    st.Page("runner.py", title="Simulation"),
    st.Page("lsoa_map.py", title="Map"),
])

pg.run()


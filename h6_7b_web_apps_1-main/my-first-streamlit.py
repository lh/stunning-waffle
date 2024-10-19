import streamlit as st

st.title("Hello Streamlit!")

st.write("This is my first Streamlit app.")
my_first_number = st.number_input("Please enter a number")

st.write(f"The square of {my_first_number:.3g} is {my_first_number**2:.3g}")

my_second_number = st.slider("Please enter another number", format = "%.3g", 
                             max_value= 1000000)

st.write(f"The square of {my_second_number:.3g} is {my_second_number**2:.3g}")
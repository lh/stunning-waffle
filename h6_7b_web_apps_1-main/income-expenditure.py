import streamlit as st


def validate_input(value, name):
    if value is None or value < 0:
        st.error(f"Please enter a valid {name}.")
        return False
    return True


st.title("Hello, Wage Slave")

name = st.text_input("What is your name?")
with st.sidebar:
    name_valid = name is not None and len(name) > 0

    monthly_take_home_pay = st.number_input("What is your monthly take home pay?")

    monthly_valid = validate_input(monthly_take_home_pay, "monthly take home pay")

    housing_costs = st.number_input("What are your monthly housing costs?")
    housing_valid = validate_input(housing_costs, "housing costs")

    food_costs = st.number_input("What are your monthly food costs?")
    food_valid = validate_input(food_costs, "food costs")

    utility_costs = st.number_input("What are your monthly utility costs?")
    utility_valid = validate_input(utility_costs, "utility costs")

calc_btn = st.button("Calculate")

inputs_valid = (utility_valid and food_valid and housing_valid 
                and monthly_valid and name_valid)


if inputs_valid and calc_btn:
    total_monthly_expenses = housing_costs + food_costs + utility_costs
    disposable_income = monthly_take_home_pay - total_monthly_expenses
    st.write(f"Hello, {name}! Your monthly disposable income is £{disposable_income:.2f}.")
    if monthly_take_home_pay == 0:
        st.write(f"You don't have any money to spend on housing. Are you ok?")
        st.write("If your monthly take home pay is zero, you are not a wage slave.")
        monthly_valid = False
    else:
        per_cent_spent_on_housing = (housing_costs / monthly_take_home_pay) * 100
        st.write(f"You spend {per_cent_spent_on_housing:.2g}% of your income on housing.")

inputs_valid = (utility_valid and food_valid and housing_valid 
                and monthly_valid and name_valid)

if inputs_valid and calc_btn:
    if disposable_income < 0:
        st.error("You are spending more than you earn. Please adjust your expenses.")
    if per_cent_spent_on_housing < 20:
        st.success("BOOMER!")
        st.balloons()
    elif per_cent_spent_on_housing > 30 and per_cent_spent_on_housing <= 50:
        st.warning("You are spending more than 30% of your income on housing. Consider moving to a cheaper place.")
    elif per_cent_spent_on_housing > 50:
        st.error("You are spending more than 50% of your income on housing. You should sleep on a friend's couch.")
    st.write("Here's a breakdown of your monthly expenses:")
    st.write(f"Housing: £{housing_costs:.2f}")
    st.write(f"Food: £{food_costs:.2f}")
    st.write(f"Utilities: £{utility_costs:.2f}")
    st.write(f"Total: £{total_monthly_expenses:.2f}")
    st.write(f"Disposable income: £{disposable_income:.2f}")
    st.write(f"Percentage of income spent on housing: {per_cent_spent_on_housing:.2g}%")
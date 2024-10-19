import pandas as pd
import numpy as np
import plotly.express as px

import streamlit as st

from simulation import g, Patient, Caller, Trial

from utils import load_css

load_css("style.css")

run = st.button("Run Simulation")

with st.sidebar:
    with st.expander("Patient Parameters"):
        col1, col2 = st.columns(2)

        with col1:
            patient_inter_slider = st.slider("Minutes between patient arrivals", min_value=1, max_value=10, value=5)

        with col2:
            call_inter_slider = st.slider("Minutes between phones calls", min_value=1, max_value=20, value=10)

    with st.expander("Reception Parameters"):
        col3, col4 = st.columns(2)

        with col3:
            number_of_receptionists_slider = st.slider("Receptionists", min_value=1, max_value=4, value=1)

        with col4:
            mean_reg_time_slider = st.slider("Reception interaction, minutes", min_value=0.5, max_value=20.0, value=2.0)
            
        with col3:
            mean_book_test_time_slider = st.slider("Test booking, minutes", min_value=2.0, max_value=20.0, value=4.0)
           
        with col4:
            mean_call_time_slider = st.slider("Time on each call, minutes", min_value=0.5, max_value=20.0, value=4.0)



    with st.expander("Doctor Parameters"):
        col5, col6 = st.columns(2)

        with col5:
            number_of_gps_slider = st.slider("Number of GPs", min_value=1, max_value=4, value=2)

        with col6:
            mean_gp_time_slider = st.slider("Time with GP, minutes", min_value=5.0, max_value=40.0, value=15.0)

    with st.expander("Advanced Parameters"):
        st.warning("These parameters are advanced and should only be changed if you know what you are doing.")
        prob_book_test_slider = st.slider("Probability of booking test", min_value=0.0, max_value=1.0, value=0.25)
        col7, col8 = st.columns(2)
        with col7:
            sim_duration_slider = st.slider("Simulation duration, minutes", min_value=10, max_value=1440, value=720)
        with col8:
            number_of_runs_slider = st.slider("Number of runs", min_value=1, max_value=20, value=10)

# Update global parameter values

    # Inter-arrival times
    g.patient_inter = patient_inter_slider
    
    g.call_inter = call_inter_slider

    # Activity times
    g.mean_reg_time = mean_reg_time_slider
    g.mean_gp_time = mean_gp_time_slider
    g.mean_book_test_time = mean_book_test_time_slider
    g.mean_call_time = mean_call_time_slider

    # Resource numbers
    g.number_of_receptionists = number_of_receptionists_slider
    g.number_of_gps = number_of_gps_slider

    # Branch probabilities
    g.prob_book_test = prob_book_test_slider

    # Simulation meta parameters
    g.sim_duration = sim_duration_slider
    g.number_of_runs = number_of_runs_slider



###########################################################
# Run a trial using the parameters from the g class and   #
# print the results                                       #
###########################################################
if run: 
    df_trial_results, caller_results, patient_results = Trial().run_trial()

    with st.expander("Tablulated results"):
        nhs_colour_sequence = ["rgb(135,206,250,0.5)", "rgb(255,184,28,0.5)", "#00A499", "#41B6E6", "#AE2573", "#006747"]
        st.dataframe(df_trial_results)

        
    # ##############################################
    # # Bar plot - average waits per stage per run #
    # ##############################################
    average_waits_fig = px.bar(
        df_trial_results.drop(
            columns=["GP Utilisation - Percentage",
                    "Receptionist Utilisation - Percentage"])
                    .reset_index(drop=False)
                    .melt(id_vars="Run Number"),
            x="value", # What's on the horizontal axis - this is the number of minutes
            y="Run Number", # What's on the vertical axis
            facet_col="variable", # This will create a separate plot for each variable (here, the metric)
            # Give the whole plot a title
            title="Average Waits (Minutes) For Each Stage of the Patient Journey - by Run",
            orientation='h', # Set this to a horizontal bar plot (default is vertical)
            labels={"value": "Average Wait (Mins)"}, # Make the label on the x axis nicer
            # Use our NHS colour palette; only the first colour will be used as we haven't
            # made use of colour as a part of the visualisation in this plot, but this does mean
            # that the bars will use the standard NHS blue rather than the plotly one
            color_discrete_sequence=nhs_colour_sequence
            )

    # After we use the px.bar function to create our plot, there will be a few additional things
    # we want to do to the plot before displaying it. There is a limit to what can be done in
    # the original function call as there are only so many parameters - these little extra touches
    # just make the plot as readable and polished-looking as possible!

    # This will tidy up the subtitles of each 'facet' within our plot (the mini-graph relating)
    # to each of our metrics
    # This uses what's called a 'lambda' function, which is a little temporary function that in this case
    # iterates through the annotation text and replaces the string 'variable=' with an empty string,
    # which just tidies up the headers in this case so it only contains the actual name of the variable
    average_waits_fig.for_each_annotation(lambda a: a.update(text=a.text.replace("variable=", "")))

        # Here we are going to update the layout to ensure that we have a label for every run number in
        # our y axis
        # By default, plotly tries to intelligently choose a scale - but for this, it makes more sense to
        # include a label for every row (unless we have lots of runs, in which case we won't apply this
        # correction)
    if g.number_of_runs < 20:
        average_waits_fig.update_layout(yaxis = {'dtick': 1})

        # Finally, we force plotly to display the plot in the interactive window.
        # If we don't use this then only the final plotly plot we create will actually be displayed
        #average_waits_fig.show()
    st.plotly_chart(average_waits_fig)


        # ##############################################
        # # Strip Plot - Arrival Patterns              #
        # ##############################################

        # Finally, let's make a scatterplot that can help us to just check that the patterns of arrivals
        # across the day makes sense. Are the callers and patients arriving in an intermingled fashion
        # and do we have some of each?
        # This plot might be of more use for debugging than actually understanding the model behaviour -
        # although it can also be useful to demonstrate that the arrival times are not fixed across
        # the different runs, which can help people to understand the value and functioning of the model

        # We start by joining the patient and caller results together
    calls_and_patients = pd.concat([
                # we only want a few columns from each
            patient_results[["Run", "Arrival Time", "What"]],
                # It's important that the columns are in the same order and have the same names
                # as we are just going to stack them on top of each other
            caller_results[["Run", "Call Start Time", "What"]].rename(columns={"Call Start Time": "Arrival Time"})
                ])

        # Here we are going to use something called a strip plot, which is a scatterplot (a plot with
        # a series of dots - but with some level of randomness on one axis to ensure points at exactly
        # the same position don't fully overlap)
    arrival_fig = px.strip(
            # We pass in the dataframe we just created
        calls_and_patients,
            # We place the points horizontally depending on the time the individual caller or patient
            # arrived in the model
        x="Arrival Time",
            # We then use the run number on the y axis, which will give us a line of points per run
        y="Run",
            # We'll use the colour to distinguish between patients and callers
        color="What",
            # We'll use our colour palette
        color_discrete_sequence=nhs_colour_sequence,
            # Finally, let's add a title
        title="Patient Arrivals by Time",
        labels={"Arrival Time": "Arrival Time (Simulation Minute)"}
    )

    # Force the maximum amount of jitter (random offset) in the points
    arrival_fig.update_traces() #jitter=1.0)

    # Display the plot in streamlit
    st.plotly_chart(arrival_fig)



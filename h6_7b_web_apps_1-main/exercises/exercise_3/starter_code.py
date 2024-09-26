import pandas as pd
import plotly.express as px
import geopandas
import matplotlib.pyplot as plt
import streamlit as st
import numpy as np

# Load data with error handling
try:
    country_medals_by_event = pd.read_csv("country_medals_by_event.csv")
    medals_per_country_per_year = pd.read_csv("medals_per_country_per_year.csv")
except FileNotFoundError as e:
    st.error(f"Error loading data: {e}")
    country_medals_by_event = pd.DataFrame()
    medals_per_country_per_year = pd.DataFrame()

st.write("Columns in medals_per_country_per_year:", medals_per_country_per_year.columns)
st.write("Columns in country_medals_by_event:", country_medals_by_event.columns)
# helper function to format a list with "and" between the last item. 
def format_list_with_and(items):
    items = list(items)  # Convert to list to handle array-like objects
    if not items:
        return ""
    if len(items) == 1:
        return str(items[0])
    return ", ".join(map(str, items[:-1])) + " and " + str(items[-1])



# helper function to get the available options for a given column
def get_available_options(df, column, years=None, countries=None, sports=None):
    filtered_df = df.copy()
    if years and 'Year' in filtered_df.columns:
        filtered_df = filtered_df[filtered_df['Year'].isin(years)]
    if countries and 'Country' in filtered_df.columns:
        filtered_df = filtered_df[filtered_df['Country'].isin(countries)]
    if sports and 'Sport' in filtered_df.columns:
        filtered_df = filtered_df[filtered_df['Sport'].isin(sports)]
    return sorted(filtered_df[column].unique()) if column in filtered_df.columns else []

# Sidebar for selections
# Sidebar for selections
st.sidebar.header("Select Filters")

# Year selection
all_years = sorted(medals_per_country_per_year['Year'].unique())
years = st.sidebar.multiselect("Choose years:", all_years)

# Country selection
available_countries = get_available_options(medals_per_country_per_year, 'Country', years)
countries = st.sidebar.multiselect("Choose countries:", available_countries)

# Sport selection
available_sports = get_available_options(country_medals_by_event, 'Sport', years, countries)
sports = st.sidebar.multiselect("Choose sports:", available_sports)
# Display medals over time plot
medals_per_country_per_year_long = medals_per_country_per_year.melt(
    id_vars=["Year", "Country", "NOC"],
    value_vars=["Gold", "Silver", "Bronze"],
    var_name="Medal",
    value_name="Count"
)

# Apply filters
filtered_data = medals_per_country_per_year_long

if years:
    filtered_data = filtered_data[filtered_data["Year"].isin(years)]
if countries:
    filtered_data = filtered_data[filtered_data["Country"].isin(countries)]
else:
    # If no countries are selected, show top 5 countries by total medal count
    top_countries = medals_per_country_per_year.groupby("Country")["Total"].sum().nlargest(5).index
    filtered_data = filtered_data[filtered_data["Country"].isin(top_countries)]

if filtered_data.empty:
    st.warning("No data available for the selected filters.")
else:
    countries_in_plot = filtered_data['Country'].unique().tolist()
    fig = px.bar(
        filtered_data,
        x="Year",
        y="Count",
        color="Medal",
        facet_row="Country",
        color_discrete_map={"Gold": "gold", "Silver": "silver", "Bronze": "orange"},
        title=f"Medals Won over Time - {format_list_with_and(countries_in_plot)}"
    )
    fig.update_yaxes(tickmode='linear', tick0=0, dtick=5)
    fig.update_layout(height=300 * len(countries_in_plot))  # Adjust height based on number of countries
    st.plotly_chart(fig)

# Display sports data
if sports:
    sports_str = format_list_with_and(sports)
    with st.expander(f"Sports data for {sports_str}" + (f" in {format_list_with_and(years)}" if years else "")):
        country_medals_by_event_filtered = country_medals_by_event[
            (country_medals_by_event["Sport"].isin(sports))
        ]
        if years:
            country_medals_by_event_filtered = country_medals_by_event_filtered[
                country_medals_by_event_filtered["Year"].isin(years)
            ]
        if countries:
            country_medals_by_event_filtered = country_medals_by_event_filtered[
                country_medals_by_event_filtered["Country"].isin(countries)
            ]
        st.write(country_medals_by_event_filtered[['Year', 'Country', 'Event', 'Bronze', 'Silver', 'Gold']])

# Display medal distribution map for selected year
if years:
    st.subheader(f"Medal Distribution Map for {format_list_with_and(years)}")
 

    selected_medal_type="Gold"

    country_outlines = geopandas.read_file("countries_outlines.geojson")

    medals_per_country_per_year_gdf = pd.concat([
        pd.merge(country_outlines, medals_per_country_per_year, left_on="id", right_on="NOC", how="inner"),
        pd.merge(country_outlines, medals_per_country_per_year, left_on="name", right_on="Country", how="inner")
    ]).drop_duplicates()

    fig, ax = plt.subplots(figsize=(15, 8))

    medals_per_country_per_year_gdf[selected_medal_type] = medals_per_country_per_year_gdf[selected_medal_type].apply(lambda x: np.log1p(x))

    ax = medals_per_country_per_year_gdf[medals_per_country_per_year_gdf["Year"].isin(years)].plot(
        column=selected_medal_type, 
        legend=True, 
        ax=ax,  
        #cmap='OrRd',  # Choose a color map
        scheme='quantiles' # Use a logarithmic scale
        )
    country_outlines.boundary.plot(ax=ax, linewidth=.2, color='black')

    ax.axis('off')


    plt.title(f"Number of {selected_medal_type} Medals in {format_list_with_and(years)}")

    st.pyplot(fig)

###################################################
# Print out possible countries to select from for
# the next run of the script
###################################################

# Display available options

st.sidebar.markdown("---")
st.sidebar.subheader("Available Options")
st.sidebar.write(f"Years: {format_list_with_and(get_available_options(medals_per_country_per_year, 'Year', countries=countries, sports=sports))}")
st.sidebar.write(f"Countries: {format_list_with_and(get_available_options(medals_per_country_per_year, 'Country', years=years, sports=sports))}")
st.sidebar.write(f"Sports: {format_list_with_and(get_available_options(country_medals_by_event, 'Sport', years=years, countries=countries))}")
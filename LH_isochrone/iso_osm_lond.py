import requests
import folium
from folium.plugins import MarkerCluster

# OpenRouteService API endpoint
url = "https://api.openrouteservice.org/v2/isochrones/driving-car"

# Your API key (sign up at openrouteservice.org to get a free API key)
api_key = "5b3ce3597851110001cf6248ca27a11015c042c380b6324095174aa6"

# Define latitude and longitude
lat = 51.2186168267717
long = -0.1624447559290849

# Parameters for the isochrone
params = {
    "locations": [[long, lat]],  # longitude,latitude for RH1 5RH
    "range": [1800, 2700],  # 30 minutes and 45 minutes
    "interval": 1800,
    "location_type": "start",
    "attributes": ["area", "reachfactor"],
}

# Headers for the request
headers = {"Authorization": api_key, "Content-Type": "application/json"}

# Send POST request to the API
response = requests.post(url, json=params, headers=headers)

# Check if the request was successful
if response.status_code == 200:
    data = response.json()
    print(data)

    # Create a map centered on the home location
    m = folium.Map(location=[lat, long], zoom_start=10)

    # Add home marker
    folium.Marker(
        [lat, long],
        popup="East Surrey Hospital",
        icon=folium.Icon(color="red", icon="home"),
    ).add_to(m)

    # Add isochrones to the map
    colors = ["blue", "green"]
    for feature, color in zip(data["features"], colors):
        folium.GeoJson(
            feature,
            style_function=lambda x, color=color: {
                "fillColor": color,
                "color": color,
                "weight": 2,
                "fillOpacity": 0.3,
            },
            tooltip=f"{feature['properties']['value'] / 60} minutes",
        ).add_to(m)

    # Save the map
    m.save("ors_isochrone_map_ESH_45_60.html")
    print("Map saved as ors_isochrone_map_ESH_45_60.html")
else:
    print(f"Error: {response.status_code}")

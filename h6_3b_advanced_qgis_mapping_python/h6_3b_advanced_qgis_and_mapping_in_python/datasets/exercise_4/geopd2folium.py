import geopandas as gpd
import folium
from folium import GeoJson

# Create a GeoDataFrame by reading a sample dataset
gdf = gpd.read_file(gpd.datasets.get_path('nybb'))

# Ensure the GeoDataFrame is using the correct CRS
gdf = gdf.to_crs(epsg=4326)

# Calculate the center of the dataset
center = gdf.total_bounds.reshape((2,2)).mean(axis=0)

# Create a Folium map centered on the mean of the GeoDataFrame's bounding box
m = folium.Map(location=[center[1], center[0]], zoom_start=10)

# Add the GeoDataFrame to the map
GeoJson(gdf).add_to(m)

# Save or display the map
m.save('map.html')


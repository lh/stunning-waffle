import geopandas
import pandas as pd

msoa_gdf = geopandas.read_file("h6_3b_advanced_qgis_and_mapping_in_python/_source/dataset_generation/helpers/stats_19_counts_by_msoa_3857.geojson")

cols_to_calc_rate_list =  ['fatal_casualties_2018_2022',
       'cyclist_casualties_2018_2022', 'pedestrian_casualties_2018_2022',
       'horse_rider_casualties_2018_2022', 'car_occupant_casualties_2018_2022', 'motorcycle_casualties_2018_2022']

for col in cols_to_calc_rate_list:
    new_colname = f"{col}_rate"
    msoa_gdf[new_colname] = msoa_gdf.apply(lambda row: (row[col] / row['total_number_of_casualties_by_msoa_of_accident_2018_2022']), axis=1)

cols_to_calc_rate_coll_list =  ['snow_collisions_2018_2022',
       'fog_or_mist_collisions_2018_2022', 'darkness_collisions_2018_2022',
       'daylight_collisions_2018_2022', 'summer_collisions_2018_2022',
       'winter_collisions_2018_2022']

for col in cols_to_calc_rate_coll_list:
    new_colname = f"{col}_rate"
    msoa_gdf[new_colname] = msoa_gdf.apply(lambda row: (row[col] / row['total_number_of_collisions_2018_2022']), axis=1)

# calcualte per 1000 occupants

msoa_pop_ests_2020 = pd.read_excel("h6_3b_advanced_qgis_and_mapping_in_python/_source/dataset_generation/helpers/sape23dt4mid2020msoasyoaestimatesunformatted.xlsx",
              sheet_name="Mid-2020 Persons", skiprows=4,usecols="A:G")[['MSOA Code', 'All Ages']]

msoa_gdf_pop = pd.merge(left=msoa_gdf, right=msoa_pop_ests_2020, left_on="MSOA11CD", right_on="MSOA Code", how="left")


cols_to_calc_list =  ['total_number_of_casualties_by_casualty_lsoa_2018_2022', 'fatal_casualties_2018_2022',
       'cyclist_casualties_2018_2022', 'pedestrian_casualties_2018_2022',
       'horse_rider_casualties_2018_2022', 'car_occupant_casualties_2018_2022', 'snow_collisions_2018_2022',
       'fog_or_mist_collisions_2018_2022', 'darkness_collisions_2018_2022',
       'daylight_collisions_2018_2022', 'summer_collisions_2018_2022',
       'winter_collisions_2018_2022']

for col in cols_to_calc_list:
    new_colname = f"{col}_per_1000_occ"
    msoa_gdf_pop[new_colname] = msoa_gdf_pop.apply(lambda row: (row[col] / row['All Ages']) * 1000 , axis=1)


#msoa_gdf_pop.to_file("h6_3b_advanced_qgis_and_mapping_in_python/datasets/stats_19_counts_by_msoa_normalised_3857.geojson", driver='GeoJSON')

msoa_boundaries_file = (
    msoa_gdf_pop[['MSOA11CD', 'MSOA11NM', 'MSOA11NMW', 'BNG_E', 'BNG_N', 'LONG', 'LAT',
       'GlobalID','geometry']]
)

msoa_boundaries_file.to_file("h6_3b_advanced_qgis_and_mapping_in_python/datasets/msoa_boundaries.geojson", driver='GeoJSON')

msoa_data_file = (
     msoa_gdf_pop.drop(columns=['MSOA11NM', 'MSOA11NMW', 'BNG_E', 'BNG_N', 'LONG', 'LAT',
       'GlobalID','geometry'])
)

msoa_data_file.to_csv("h6_3b_advanced_qgis_and_mapping_in_python/datasets/stats_19_counts_by_msoa_normalised.csv")

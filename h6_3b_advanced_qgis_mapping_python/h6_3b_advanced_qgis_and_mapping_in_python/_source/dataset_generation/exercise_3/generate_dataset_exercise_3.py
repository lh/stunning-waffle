import pandas as pd
import requests
import numpy as np
import geopandas

# https://opendata.nhsbsa.net/dataset/english-contractor-monthly-general-dental-activity/resource/e9e0e230-5667-4e48-9746-0ffcea11938a
dent_contractor = pd.read_csv("h6_3b_advanced_qgis_and_mapping_in_python/_source/dataset_generation/helpers/uda_contractor_202312.csv")

postcode_list = dent_contractor['LATEST_PPC_ADDRESS_POSTCODE'].unique()

# Create an empty list for our results
results = []

# Iterate through the postcodes 100 at a time, returning the data from the API
for i in range(int(np.ceil(len(postcode_list)/100))):

    postcode_list_filtered = postcode_list[i*100:(((i+1)*100)-1)]
    print(f"Collecting postcodes {i*100} to {(((i+1)*100)-1)}")

    # Send API request, passing in your postcodes as a list
    postcode_lookup = requests.post(
        "https://api.postcodes.io/postcodes",
        json={"postcodes": postcode_list_filtered.tolist()}
    )

    results.append(postcode_lookup)

results_dfs = [pd.json_normalize(i.json()['result'], sep='_')
for i in results]

# join all of our dataframes into a single dataframe.
postcodes_df = pd.concat(results_dfs)

dent_coords = pd.merge(
    left=dent_contractor,
    right=postcodes_df,
    left_on="LATEST_PPC_ADDRESS_POSTCODE",
    right_on="query"
)

dent_df_final = dent_coords[['CONTRACT_NUMBER', 'PROVIDER_NAME', 'LATEST_PPC_ADDRESS_POSTCODE',
       'LSOA11_CODE', 'UDA_PERF_TARGET', 'UDA_FIN_VAL', 'UDA_DELIVERED',
       'LATE_SUBMITTED_FP17', 'UDA_DELIVERED_FD', 'BAND_1_DELIVERED',
       'BAND_2A_DELIVERED ', 'BAND_2B_DELIVERED', 'BAND_2C_DELIVERED',
       'BAND_3_DELIVERED', 'BAND_URGENT_DELIVERED', 'BAND_OTHER_DELIVERED',
       'CHILD_12M_COUNT', 'ADULT_24M_COUNT', 'GENERAL_DENTAL_FIN_VALUE',
       'result_eastings', 'result_northings', 'result_nhs_ha',
       'result_longitude', 'result_latitude']]

dent_df_final = dent_df_final.groupby(['PROVIDER_NAME', 'LATEST_PPC_ADDRESS_POSTCODE', 'LSOA11_CODE', 'result_eastings', 'result_northings', 'result_nhs_ha',
       'result_longitude', 'result_latitude']).sum().fillna(0).reset_index()

# limit to dentists who delivered activity
dent_df_final = dent_df_final[dent_df_final['UDA_DELIVERED'] > 0]

dent_df_final_gdf = geopandas.GeoDataFrame(
    dent_df_final,
    geometry = geopandas.points_from_xy(
        dent_df_final['result_eastings'],
        dent_df_final['result_northings'],
    ),
    crs = 'EPSG:27700'
)

dent_df_final_gdf.to_file("dentist_activity_dec_2023.geojson", driver="GeoJSON")

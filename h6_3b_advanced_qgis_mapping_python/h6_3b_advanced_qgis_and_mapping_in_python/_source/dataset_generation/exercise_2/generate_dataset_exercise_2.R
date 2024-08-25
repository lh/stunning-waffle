# install.packages("wakefield")
# install.packages("dplyr")
# install.packages("readr")
# install.packages("glue")

library(wakefield)
library(dplyr)
library(readr)
library(glue)

oxford_postcodes <- readr::read_csv("/home/sammi/HSMA/h6_3b_advanced_qgis_and_mapping_in_python/h6_3b_advanced_qgis_and_mapping_in_python/_source/dataset_generation/helpers/ONSPD_NOV_2022_UK_OX.csv")

smoker_df <- wakefield::r_data_frame(
    n=70000,
    id(random=TRUE),
    age(x=12:89),
    sex_inclusive(
        # Roughly following NHS gender codes from data dictionary
        # https://digital.nhs.uk/data-and-information/data-collections-and-data-sets/data-sets/mental-health-services-data-set/submit-data/data-quality-of-protected-characteristics-and-other-vulnerable-groups/gender-identity
        x=c("Male (including trans man)", "Female (including trans woman)", "Non-binary", "Other (not listed)", "Not known or not stated"),
        p=c(0.6,0.36,0.02,0.01,0.01),
        name="Gender"),
    Postcode = r_sample(x=oxford_postcodes %>% pull(pcd))
) %>%
    mutate(ID = glue::glue("P{ID}"))

smoker_df %>%
    readr::write_csv("oxford_smoker_df.csv")

smoker_df_with_lsoas <- smoker_df %>%
    left_join(oxford_postcodes %>% select(pcd, lsoa11), by=c("Postcode"="pcd"))

smoker_df_with_lsoas %>%
    readr::write_csv("oxford_smoker_df_lsoa.csv")


smoker_df_with_lsoas %>%
    count(lsoa11, Gender, Age) %>%
    readr::write_csv("oxford_smoker_df_counts_lsoa_gender_age.csv")

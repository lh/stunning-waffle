
if (!requireNamespace("rvest", quietly = TRUE)) install.packages("rvest")
if (!requireNamespace("dplyr", quietly = TRUE)) install.packages("dplyr")
if (!requireNamespace("dplyr", quietly = TRUE)) install.packages("readxl")
if (!requireNamespace("httr", quietly = TRUE)) install.packages("httr")
if (!requireNamespace("jsonlite", quietly = TRUE)) install.packages("jsonlite")
if (!requireNamespace("tidyr", quietly = TRUE)) install.packages("tidyr")
if (!requireNamespace("caret", quietly = TRUE)) install.packages("caret")
if (!requireNamespace("glmnet", quietly = TRUE)) install.packages("glmnet")
library(rvest)
library(dplyr)
library(readxl)
library(httr)
library(jsonlite)
library(tidyr)
library(stringr)
library(caret)
library(glmnet)

api_key <- "1b0d64ce"

get_imdb_url <- function(movie_name, api_key) {
  base_url <- "http://www.omdbapi.com/"
  response <- GET(base_url, query = list(t = movie_name, apikey = api_key))
  content <- content(response, "text")
  data <- fromJSON(content)
  
  if (data$Response == "True") {
    return(paste0("https://www.imdb.com/title/", data$imdbID, "/"))
  } else {
    return(NA)
  }
}






# Function to get IMDB URL from movie name using OMDB API
get_imdb_url <- function(movie_name, api_key) {
  base_url <- "http://www.omdbapi.com/"
  response <- GET(base_url, query = list(t = movie_name, apikey = api_key))
  content <- content(response, "text")
  data <- fromJSON(content)
  
  if (data$Response == "True") {
    return(paste0("https://www.imdb.com/title/", data$imdbID, "/"))
  } else {
    return(NA)
  }
}

# Enhanced function to scrape additional data from IMDB
scrape_imdb_data <- function(url) {
  if (is.na(url)) return(list(IsTopRated = NA, HasOscar = NA, IsColor = NA, HasTrailer = NA, Genres = NA, LeadActor = NA, LeadActorGender = NA))
  
  page <- read_html(url)
  
  is_top_rated <- !is.na(page %>% html_node(".ipc-watchlist-ribbon__icon") %>% html_node("svg"))
  has_oscar <- !is.na(page %>% html_node(".ipc-metadata-list-item__label:contains('Oscar')"))
  is_color <- page %>% html_node(".ipc-metadata-list-item__content-container:contains('Color')") %>% length() > 0
  has_trailer <- !is.na(page %>% html_node("a.ipc-lockup-overlay:contains('Trailer')"))
  
  # Scrape genres
  genres <- page %>% 
    html_nodes('[data-testid="genres"] a') %>% 
    html_text() %>% 
    paste(collapse = ", ")
  
  # Scrape lead actor (assuming it's the first listed actor)
  lead_actor <- page %>% 
    html_node('[data-testid="title-cast-item__actor"]') %>% 
    html_text()
  
  # Determine lead actor gender (this is a simplification and may not always be accurate)
  lead_actor_gender <- page %>% 
    html_node('[data-testid="title-cast-item__actor"]') %>% 
    html_attr("href") %>% 
    {if(!is.na(.)) {
      actor_page <- read_html(paste0("https://www.imdb.com", .))
      if(length(actor_page %>% html_nodes('a:contains("Actress")')) > 0) {
        "Female"
      } else if(length(actor_page %>% html_nodes('a:contains("Actor")')) > 0) {
        "Male"
      } else {
        "Unknown"
      }
    } else {
      NA
    }}
  
  list(IsTopRated = is_top_rated, HasOscar = has_oscar, IsColor = is_color, HasTrailer = has_trailer,
       Genres = genres, LeadActor = lead_actor, LeadActorGender = lead_actor_gender)
}

# Main function to enrich movie data
enrich_movie_data <- function(movie_tibble, movie_name_column, api_key) {
  # Get IMDB URLs
  movie_tibble$IMDB_URL <- sapply(movie_tibble[[movie_name_column]], get_imdb_url, api_key = api_key)
  
  # Scrape additional data
  additional_data <- lapply(movie_tibble$IMDB_URL, scrape_imdb_data)
  additional_data_df <- do.call(rbind, lapply(additional_data, data.frame))
  
  # Combine original tibble with additional data
  enriched_tibble <- cbind(movie_tibble, additional_data_df)
  
  return(enriched_tibble)
}



# Assuming your tibble is called 'movie_tibble' and the column with movie names is 'MovieName'
 enriched_data <- enrich_movie_data(movie_tibble, "Film Name", api_key)
 
 
 # function to encode year as boolean
 encode_year <- function(enriched_movie_data){
   enriched_movie_data <- enriched_movie_data %>%
   mutate(
     Is1950s = 'Year of Release' >= 1950 & 'Year of Release' < 1960,
     Is1960s = 'Year of Release' >= 1960 & 'Year of Release' < 1970,
     Is1970s = 'Year of Release' >= 1970 & 'Year of Release' < 1980,
     Is1980s = 'Year of Release' >= 1980 & 'Year of Release' < 1990,
     Is1990s = 'Year of Release' >= 1990 & 'Year of Release' < 2000,
     Is2000s = 'Year of Release' >= 2000 & 'Year of Release' < 2010,
     Is2010s = 'Year of Release' >= 2010 & 'Year of Release' < 2020,
     Is2020s = 'Year of Release' >= 2020 & 'Year of Release' < 2030
   )
 return(enriched_movie_data)
 }
 
 

 # function to encode genre as booleans
 encode_genre <- function(enriched_data){
   enriched_data <- enriched_data %>%
   # Ensure Genres column has content
   mutate(Genres = if_else(is.na(Genres) | Genres == "", "Unknown", Genres)) %>%
   # Split the Genre column into separate rows
   separate_rows(Genres, sep = ", ") %>%
   # Remove any leading or trailing whitespace
   mutate(Genres = str_trim(Genres)) %>%
   # Create a new column for each unique genre, with TRUE/FALSE values
   mutate(GenrePresent = TRUE) %>%
   pivot_wider(
     names_from = Genres,
     values_from = GenrePresent,
     values_fill = list(GenrePresent = FALSE)
   ) %>%
   # Rename columns to add 'Is' prefix, but only for new columns
   rename_with(~paste0("Is", .), .cols = setdiff(names(.), names(enriched_data)))
 return(enriched_data)
 }

 

 # Assuming your tibble is called 'movie_tibble' and the column with movie names is 'MovieName'
 
 make_boolean <- function(enriched_data){
   enriched_data <- encode_year(enriched_data)
   enriched_data <- encode_genre(enriched_data)
   return(enriched_data)
 }
 
 get_data <- function(filepath_to_excel){
   movie_tibble <- read_excel(filepath_to_excel, 
                              col_types = c("text", "numeric", "text"))
   movie_tibble <- movie_tibble %>%
     mutate(`take` = ifelse(tolower(`Take to Island?`) == "yes", TRUE, FALSE))
   
   enriched_data <- enrich_movie_data(movie_tibble, "Film Name", api_key)
   movie_data_with_genre_booleans <- make_boolean(enriched_data)
   return(movie_data_with_genre_booleans)
 }
 
 movie_data_with_genre_booleans <- get_data("dan_desert_training.xlsx")
 
 movie_data_with_genre_booleans_test_data <- get_data("dan_desert_test.xlsx")
 
# Assuming your final dataset is called 'movie_data_with_genre_booleans'
# and 'take' is a boolean column (TRUE/FALSE or 1/0)

 
prepare_data <- function(movie_data_with_genre_booleans) {
# First, let's prepare our data
model_data <- movie_data_with_genre_booleans %>%
  # Select only boolean columns and the 'take' column
  select(take, starts_with("Is")) %>%
  # Remove any rows with NA values
  na.omit()

# Convert 'take' to a factor (if it's not already)
model_data$take <- as.factor(model_data$take)
return(model_data)
}


# Split the data into training and testing sets is usual but we have a seperate training set here. 
set.seed(123)  # for reproducibility
# train_indices <- createDataPartition(model_data$take, p = 0.8, list = FALSE)
# train_data <- model_data[train_indices, ]
# test_data <- model_data[-train_indices, ]

train_data <- prepare_data(movie_data_with_genre_booleans)

test_data <- prepare_data(movie_data_with_genre_booleans_test_data)




# Train the model
model <- train(
  take ~ .,
  data = train_data,
  method = "glmnet",
  trControl = trainControl(method = "cv", number = 5),
  family = "binomial"
)

# Print model summary
print(model)

# Make predictions on the test set
predictions <- predict(model, newdata = test_data)

# Evaluate the model
conf_matrix <- confusionMatrix(predictions, test_data$take)
print(conf_matrix)

# Feature importance
importance <- varImp(model)
print(importance)

# Plot feature importance
plot(importance)

# If you want to use the model to make predictions on new data:
# new_predictions <- predict(model, newdata = new_data) 
 
 
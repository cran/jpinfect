## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, include = FALSE---------------------------------------------------
library(jpinfect)

## ----message = FALSE, warning = FALSE, eval = FALSE---------------------------
# # install.packages("jpinfect")
# if(!require("remotes")) install.packages("remotes")
# remotes::install_github("TomonoriHoshi/jpinfect")

## ----load_package-------------------------------------------------------------
library(jpinfect)

## ----basic_usage--------------------------------------------------------------
data("sex_prefecture")
data("place_prefecture")
data("bullet")

## ----data_exploration sex_prefecture------------------------------------------
str(sex_prefecture)

## ----data_exploration place_prefecture----------------------------------------
str(place_prefecture)

## ----data_exploration bullet--------------------------------------------------
str(bullet)

## ----merge--------------------------------------------------------------------
# Load the built-in datasets
data("sex_prefecture")
data("place_prefecture")
data("bullet")

# Merge two datasets
confirmed_dataset <- jpinfect_merge(sex_prefecture, place_prefecture)

# Merge three datasets
bind_result <- jpinfect_merge(sex_prefecture, place_prefecture, bullet)

## ----data_exploration_1, eval=FALSE-------------------------------------------
# # Check the structure of the merged dataset
# head(confirmed_dataset)
# 
# head(bind_result)
# 

## ----pivot--------------------------------------------------------------------
# Convert from wide to long format
bullet_long <- jpinfect_pivot(bullet)

# Convert from long to wide format
bullet_wide <- jpinfect_pivot(bullet_long)

## ----data_exploration_2-------------------------------------------------------
# Check the structure of long format
head(bullet_long)

# Check the structure of wide format
head(bullet_wide)


## ----source_check, eval = FALSE-----------------------------------------------
# # Check data source URL for sex and prefecture data
# jpinfect_url_confirmed(year = 2021, type = "sex")
# 
# # Check data source URL for place of infection and prefecture data
# jpinfect_url_confirmed(year = 2021, type = "place")

## ----download, eval = FALSE---------------------------------------------------
# # Download data for 2020 and 2021
# jpinfect_get_confirmed(years = c(2020, 2021), type = "sex")
# 
# # Download English data for weeks 1 to 5 in 2025
# jpinfect_get_bullet(year = 2025, week = 1:5, dest_dir = "raw_data")

## ----read, eval = FALSE-------------------------------------------------------
# # Read a single file
# dataset2021 <- jpinfect_read_confirmed(path = "2021_Syu_01_1.xlsx")
# 
# # Read all files in a directory
# place_dataset <- jpinfect_read_confirmed(path = "raw_data", type = "place")
# 
# # Read provisional data
# bullet <- jpinfect_read_bullet(directory = "raw_data")


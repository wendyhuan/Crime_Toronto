#### Preamble ####
# Purpose: Cleans the raw crime data into cleaned data 
# Author: Yanfei Huang 
# Date: 21 September 2024
# Contact: yanfei.huang@mail.utoronto.ca
# License: University of Toronto
# Pre-requisites: raw data from raw_data.csv
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

cleaned_data <- raw_data %>%
  # Use the 'CATEGORY' column to only filter out crimes against property and crimes against people
  filter(CATEGORY %in% c("Crimes Against Property", "Crimes Against the Person")) |>
  # Rename variable subtype into 'CRIME_TYPE'
  rename(CRIME_TYPE = SUBTYPE) |>
  # Combine different Break & Enter types into Break and Enter crimes
  mutate(CRIME_TYPE = if_else(str_detect(CRIME_TYPE, "Break & Enter"), 
                              "Break & Enter", CRIME_TYPE)) |>
  # Combine different Theft types into Theft crimes
  mutate(CRIME_TYPE = if_else(str_detect(CRIME_TYPE, "Theft"), 
                            "Theft", CRIME_TYPE)) |>
  # Combine different Robbery types into Robbery crimes
  mutate(CRIME_TYPE = if_else(str_detect(CRIME_TYPE, "Robbery"), 
                              "Robbery", CRIME_TYPE)) |>
  # Make a categorical column 'COVID_PERIOD' that indicates Pre-Covid for years
  #make 2014-2019 the first five years a period
  # 2020-2023 as the COVID Period 
  mutate(Period = case_when(
    REPORT_YEAR %in% 2014:2019 ~ "2014-2019",
    REPORT_YEAR %in% 2020:2022 ~ "COVID Period",
    REPORT_YEAR == 2023~ "After COVID"))

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")


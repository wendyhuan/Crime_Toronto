#### Preamble ####
# Purpose: Test if the simulated data has NA or other unneeded data
# Author: Yanfei Huang
# Date: 25 September 2024
# Contact: yanfei.huang@mail.utoronto.ca
# License: University of Toronto
# Pre-requisites: simulated data
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)

#### Test data ####
simulated_data <- read_csv("data/raw_data/simulated_data.csv")

# Check year range
year_range <- simulated_data$reported_y
test_year_range <- all(year_range >= 2014 & year_range <= 2024)
test_year_range

# Test if all crime types are within the defined set
test_crime_type <- all(simulated_data$crime_type %in% 
                         c("Theft","SEXUAL Violation", "Fraud", "Attempt Murder", 
                           "Break & Enter", "Robbery", "Other","Assault")
)

test_crime_type

# Test if all divisions are within the defined set
test_divisions <- all(simulated_data$division 
                      %in% c("D11", "D12", "D13", "D14", "D22", "D23", "D31", 
                             "D32", "D33", "D41", "D42", "D43", "D51", "D52", 
                             "D53", "D55"))

test_divisions

# Test if all crime against are within the defined set
test_crime_towards <- all(simulated_data$crime_towards 
                          %in% c("Crimes Against Property", "Crimes Against the Person"))
test_crime_towards

# Test if all cleared values are only 0 or 1
test_cleared_values <- all(simulated_data$cleared %in% c(0, 1))

test_cleared_values

# Test data type for simulated_data
class(simulated_data$reported_y) == "numeric"
class(simulated_data$division) == "character"
class(simulated_data$crime_towards) == "character"
class(simulated_data$crime_type) == "character"
class(simulated_data$cleared) == "numeric"

# Test for NAs
all(is.na(simulated_data$reported_y))
all(is.na(simulated_data$division))
all(is.na(simulated_data$crime_towards))
all(is.na(simulated_data$cleared))
all(is.na(simulated_data$crime_type))


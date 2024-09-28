#### Preamble ####
# Purpose: Simulates the downloaded raw data for further data cleaning 
# Author: Yanfei Huang
# Date: 25 September 2024
# Contact: yanfei.huang@mail.utoronto.ca
# License: University of Toronto
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(opendatatoronto)

### Set seed for future check
set.seed(1007968086)

# define simulated numbers
#simulation1 for crime in recent 10 years
year <- seq(2014, 2024) 
division <- c("D11", "D12", "D13", "D14", "D22", "D23", "D31", "D32", 
              "D33", "D41", "D42", "D43", "D51", "D52", "D53", "D55")
crime_types <- c( "Theft","SEXUAL Violation", "Fraud", "Attempt Murder", 
                  "Break & Enter", "Robbery", "Other","Assault")
crime_against <- c("Crimes Against Property", "Crimes Against the Person")

#### Simulate data ####
# randomly simulate 1000 crimes for 
crime <- 1000

#simulate crime between 2014-2024
simulated_crime <- tibble(
    # Randomly simulate 1000 crime reports in random divisions and random crime type in 2014-2024
    reported_y = sample(year, size = crime, replace = TRUE),
    division = sample(division, size = crime, replace = TRUE),
    crime_type = sample(crime_types, size = crime, replace = TRUE),
    crime_towards = sample (crime_against, size = crime, replace = TRUE),
    cleared = sample(c(0, 1), size = crime, replace = TRUE, prob = c(0.5, 0.5))
  )

head(simulated_crime)

##### Save simulated data ####
write_csv(simulated_crime, file = "data/raw_data/simulated_data.csv")


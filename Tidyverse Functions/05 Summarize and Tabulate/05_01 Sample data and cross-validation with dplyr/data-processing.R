library("tidyverse")

normal_transport_data <- read_csv("data/transport_data.csv")

normal_transport_data

normal_transport_data %>%
  sample_frac(0.5)

## load the grouped_transport_data object
load("data/grouped_transport_data.rdata")

grouped_transport_data

grouped_transport_data %>%
  sample_frac(0.5)

#using sample_n
normal_transport_data %>%
  sample_n(50)

#Use replace argument to resample from group:
grouped_transport_data %>%
  sample_n(50, replace = TRUE)












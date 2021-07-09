library("tidyverse")

transport_data <- read_csv("data/transport_data.csv")
transport_grouped_data <- transport_data %>%
  group_by(receiver.country, receiver.city) %>%
  select(date, number.of.items) %>%
  sample_frac(0.1)
#to calculate how many rows per group:
transport_grouped_data %>%
  mutate(members = n()) %>%
  select(-date,-number.of.items) %>%
  unique()

#function to get unique count:
transport_grouped_data %>%
  n_groups()
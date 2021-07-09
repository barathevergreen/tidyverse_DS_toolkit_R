library("tidyverse")

transport_data <- read_csv("data/transport_data.csv")

## Columns of interest, in different formats
useful_columns_naked <- c(date,sender.city,receiver.city,number.of.items)
useful_columns_strings <- c("date","sender.city","receiver.city","number.of.items")

packageVersion("dplyr")

#after dplyr >= 0.7, we use non standard evaluation
#we can use select for strings
transport_data %>%
  select(useful_columns_strings) %>%
  view()
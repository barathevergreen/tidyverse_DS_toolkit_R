library("tidyverse")

transport_data <- read_csv("data/transport_data.csv")

## ================== Measurement column
measure_col_naked <- number.of.items

transport_data %>%
  select(measure_col_naked)

#with Quosure
#set quosure to naked column:
measure_col_naked <- quo(number.of.items)

#tell R that it is quosure method 1
transport_data %>%
  select(!!measure_col_naked)

#Tell R - Quosure method 2:
transport_data %>%
  select(UQ(measure_col_naked))

## ================== Useful columns
#Without quosure
useful_columns_naked <- c(date, receiver.city, number.of.items)

transport_data %>%
  select(useful_columns_naked)

#With quosure
useful_columns_naked <- quos(date, receiver.city, number.of.items)

transport_data %>%
  select(!!!useful_columns_naked)

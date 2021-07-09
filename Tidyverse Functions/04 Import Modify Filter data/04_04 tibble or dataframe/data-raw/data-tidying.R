library("tidyverse")

raw_transport_data <- read_csv("data-raw/transit-data.csv", skip = 1)

colnames(raw_transport_data) <-
  tolower(make.names(colnames(raw_transport_data)))

write_csv(raw_transport_data, "data/transport-data.csv")

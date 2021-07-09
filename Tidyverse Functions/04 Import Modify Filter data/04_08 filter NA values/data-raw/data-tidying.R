library("tidyverse")

transport_data <- read_csv("data-raw/transport_data.csv")

#use filter to extract only NA rows:
transport_data %>%
  filter(is.na(sender.state))

#use complete.cases to get valid rows:
transport_data %>%
  filter(complete.cases(.))


write_csv(transport_data, path = "data/transport_data.csv")
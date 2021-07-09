library("tidyverse")
library("readxl")
library("lubridate")

transport_data <- read_xlsx("data-raw/transit-data.xlsx", sheet = "transport data", skip = 1)
colnames(transport_data) <- tolower(make.names(colnames(transport_data)))

transport_data

#use seperate to split these values based on delimiter:
transport_data %>%
  separate(sender.location, c("sender.country","sender.city"), sep = ", ")

#use select and slice to view particular rows:
transport_data %>%
  select(sender.location) %>%
  slice(c(316, 317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331))

#use extra = merge to handle multiple delimiters:
transport_data <- transport_data %>%
  separate(sender.location, c("sender.country","sender.city"), sep = ", ", extra = "merge") %>%
  slice(c(316, 317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331))

#for receiver location:
transport_data <- transport_data %>%
  separate(receiver.location, c("receiver.country","reciever.city"), sep = ", ", extra = "merge")

transport_data

write_csv(transport_data, "data/transport_data.csv")
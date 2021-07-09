library("tidyverse")

transport_data <- read_csv("data/transport-data.csv")
#1 Only selected columns
transport_data %>%
  select(sender.location,receiver.location) %>%
  unique()
#2 particular receiver location
transport_data %>%
  filter(receiver.location == "DEU, Templin")
#3 find recent and old dates 
transport_data %>%
  select(date) %>%
  .[[1]] %>%
  max()


transport_data %>%
  select(date) %>%
  .[[1]] %>%
  min()

#4 use in select as second value:
transport_data %>%
  filter(receiver.location == "DEU, Templin") %>%
  filter(date == max(date))
#5 Removing unneeded columns:
transport_data %>%
  filter(receiver.location == "DEU, Templin") %>%
  filter(date == max(date)) %>%
  select(-receiver.location)

#6 Remove all columns containing "receive":
transport_data %>%
  filter(receiver.location == "DEU, Templin") %>%
  filter(date == max(date)) %>%
  select(-contains("receive"))

#7 Based on column positions
transport_data %>%
  filter(receiver.location == "DEU, Templin") %>%
  filter(date == max(date)) %>%
  select(sender.location:sender.longitude)

#8 Select few columns first and then everything
transport_data %>%
  filter(receiver.location == "DEU, Templin") %>%
  filter(date == max(date)) %>%
  select(date,sender.location,everything())



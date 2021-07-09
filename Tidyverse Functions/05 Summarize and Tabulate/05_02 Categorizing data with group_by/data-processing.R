library("tidyverse")

transport_data <- read_csv("data/transport_data.csv")

view(transport_data)

#group by receiver country and receiver city:
transport_data %>%
  group_by(receiver.country, receiver.city) %>%
  view()

#select selected columns
grouped_data <- transport_data %>%
  group_by(receiver.country, receiver.city) %>%
  select(date,number.of.items)

#select 10% sample
grouped_data %>%
  sample_frac(0.1)

#basic calculations can be included
#eg. based on no of items, calculating per day %
grouped_data %>%
  sample_frac(0.1) %>%
  mutate(percent.items.per.day = 100 * number.of.items/sum(number.of.items)) %>%
  mutate(check = sum(percent.items.per.day)) %>%
  ungroup()






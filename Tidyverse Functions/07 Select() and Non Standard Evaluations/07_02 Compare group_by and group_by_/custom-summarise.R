library("tidyverse")

transport_data <- read_csv("data/transport_data.csv")

#using group_by
#average no of items by country
transport_data %>%
  group_by(receiver.country) %>%
  summarise(summary = mean(number.of.items))

#Let us use a function and get it from transport data:
#Error check
item_per_group_summariser <-
  function(df, group, summarise.fn = mean) {
    df %>%
      group_by(group) %>%
      summarise(summary = summarise.fn(number.of.items))
  }

transport_data %>%
  item_per_group_summariser(receiver.country,
                            summarise.fn = max)

#using group_by_
#Column as strings:
item_per_group_summariser <-
  function(df, group, summarise.fn = mean) {
    df %>%
      group_by_(group) %>%
      summarise(summary = summarise.fn(number.of.items))
  }

transport_data %>%
  item_per_group_summariser("receiver.country",
                            summarise.fn = max)


library("tidyverse")

transport_data <- read_csv("data/transport_data.csv")

item_per_group_summariser <-
  function(df, groups, summarise.fn = mean) {
    df %>%
      group_by(groups) %>%
      summarise(summary = summarise.fn(number.of.items))
  }

transport_data %>%
  item_per_group_summariser(group = receiver.country,
                            summarise.fn = max)

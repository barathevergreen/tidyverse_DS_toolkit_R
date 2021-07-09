library("tidyverse")

long_monthly_tdiff <- read_csv("data/long_monthly_tdiff.csv")
long_horses_data <- read_csv("data/long_horses_data.csv")

#spread using key and value:
long_monthly_tdiff %>%
  spread(airport,avg.tdiff) %>%
  view()

long_horses_data %>%
  spread(year,horses) %>%
  view()


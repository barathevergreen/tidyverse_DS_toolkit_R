library("tidyverse")

transport_data <- read_csv("data/transport_data.csv") %>%
  group_by(receiver.country, receiver.city) %>%
  select(date, number.of.items)

#summarise function using regular code:
#How many items per city ?
transport_data %>%
  mutate(observations = n()) %>%
  select(-date,-number.of.items) %>%
  unique() %>%
  view()

#with summarise
transport_data %>%
  summarise(observations = n()) %>%
  view()

#contrived(strictly controlled) data: 
#generation based on below specs:
contrived_data <- tibble(
  name = c(letters, LETTERS),
  group = rep(c("one","two","three","four"), each = 13),
  value = 1:52,
  normal.var = rnorm(52, mean = 100, sd = 5),
  uniform.var = runif(52, min = 1000, max = 2000),
  logical.var = sample(c(TRUE,FALSE), size = 52, replace = TRUE)
) %>%
  view()

#with summarise
#What is the mean value of this distribution?
contrived_data %>%
  group_by(group) %>%
  summarise_all(mean) %>%
  view()

#conditional summarise - to only numeric columns:
contrived_data %>%
  group_by(group) %>%
  summarise_if(is.numeric, mean) %>%
  view()

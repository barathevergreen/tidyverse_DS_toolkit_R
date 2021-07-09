library("tidyverse")

transport_data <- read_csv("data/transport_data.csv")
#create running total(cumulative) of no.of.items
transport_data %>%
  mutate(running.total = cumsum(number.of.items)) %>%
  view()

#visualize running.total (without arrange())
manipulated_data <- transport_data %>%
  mutate(running.total = cumsum(number.of.items)) 

manipulated_data %>%
  ggplot(aes(x = date, y = running.total)) + 
  geom_line()

#set based on date for an exponential visualization:
#after arrange(): 
manipulated_data <- transport_data %>%
  arrange(date) %>%
  mutate(running.total = cumsum(number.of.items)) 

manipulated_data %>%
  ggplot(aes(x = date, y = running.total)) + 
  geom_line()

#visualize for running total for each group of city
#graph is not clear because, diff should be given
manipulated_data <- transport_data %>%
  arrange(date) %>%
  group_by(receiver.city) %>%
  mutate(running.total = cumsum(number.of.items)) 

manipulated_data %>%
  ggplot(aes(x = date, y = running.total)) + 
  geom_line()

#visualize for running total for each group of city
#with differentiation - colour
manipulated_data <- transport_data %>%
  arrange(date) %>%
  group_by(receiver.city) %>%
  mutate(running.total = cumsum(number.of.items)) 

manipulated_data %>%
  ggplot(aes(x = date, y = running.total,
             color = receiver.city)) + geom_line()

#cumulative mean - overall average of items
#based on crowdedness -> Mean:
manipulated_data <- transport_data %>%
  arrange(date) %>%
  group_by(receiver.city) %>%
  mutate(running.total = cummean(number.of.items)) 

manipulated_data %>%
  ggplot(aes(x = date, y = running.total,
             color = receiver.city)) + geom_line()
#crowded around 400
#data is not clean so displayed like this. 
#for better understanding we try violin chart: 
manipulated_data %>%
  ggplot(aes(x = 1, y = number.of.items)) + geom_violin()

#identify viral event using quantile -75%
quantile(transport_data$number.of.items)

#any events, more than 75% - 453
manipulated_data <- transport_data %>%
  arrange(date) %>%
  group_by(receiver.city) %>%
  mutate(running.total = cummean(number.of.items)) %>%
  filter(cumany(number.of.items > 453)) %>%
  summarise(events.after.peak = n()) 

manipulated_data

#any events, less than 75% - 453
manipulated_data <- transport_data %>%
  arrange(date) %>%
  group_by(receiver.city) %>%
  mutate(running.total = cummean(number.of.items)) %>%
  filter(cumall(number.of.items < 453)) %>%
  summarise(events.before.peak = n()) 

manipulated_data

#visualize before and after
#after peak
transport_data %>%
  arrange(date) %>%
  group_by(receiver.city) %>%
  mutate(running.total = cummean(number.of.items)) %>%
  filter(cumany(number.of.items > 453)) %>%
  summarise(events.after.peak = n()) %>%
  ggplot(aes(x=receiver.city,
             y=events.after.peak)) +
  geom_col(fill = "red") + coord_flip()

#before peak
transport_data %>%
  arrange(date) %>%
  group_by(receiver.city) %>%
  mutate(running.total = cummean(number.of.items)) %>%
  filter(cumall(number.of.items < 453)) %>%
  summarise(events.before.peak = n()) %>%
  ggplot(aes(x=receiver.city,
             y=events.before.peak)) +
  geom_col(fill = "blue") + coord_flip()

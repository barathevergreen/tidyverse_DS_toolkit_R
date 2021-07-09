library("praise")
#to praise the user with random adjectives
library("tidyverse")

rep(praise(), 3)
#rep()
#first arguement repeated as many times as second arguement


#derive value to praise from an operation:
data <- c(1, 3, 5, 7, 11, 13, 17)

#for value 2.67
rep(praise(), mean(diff(data)))

#How to take the value of pipe inside to apply in replicate:
data %>%
  diff() %>%
  mean() %>%
  replicate(praise(), n = .)

#How to take result values to index:
midwest %>%
  select(state) %>%
  unique() %>%
  .[[1]] %>%
   .[[2]]
  

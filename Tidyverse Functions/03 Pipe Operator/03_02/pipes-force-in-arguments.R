library("tidyverse")
data <- c(1, 3, 5, 7, 11, 13, 17)

mean(diff(data^2))

data^2 %>%
  diff() %>%
  mean()

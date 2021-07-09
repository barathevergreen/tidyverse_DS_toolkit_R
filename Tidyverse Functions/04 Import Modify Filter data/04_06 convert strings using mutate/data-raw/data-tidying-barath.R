library("tidyverse")
library("readxl")

timeperiods_data <- read_xlsx("data-raw/transit-data.xlsx", sheet = "info")
colnames(timeperiods_data) <- tolower(make.names(colnames(timeperiods_data)))

timeperiods_data

library("lubridate")
#try year month date method
ymd("1800-01-01") %>%
  class()

#paste needed values with actual value: 
paste0(1800, "-01-01") %>%
  ymd() %>%
  class()

#use mutate verb for whole column:
#period.start
timeperiods_data <- timeperiods_data %>%
  mutate(period.start = ymd(paste0(period.start, "-01-01")),
         period.end = ymd(paste0(period.end, "-12-31")))

#add additional columns. just example
timeperiods_data <- timeperiods_data %>%
  mutate(no.chars.period.name = nchar(period.name))

write_csv(timeperiods_data, "data/timeperiods_data.csv")

timeperiods_data

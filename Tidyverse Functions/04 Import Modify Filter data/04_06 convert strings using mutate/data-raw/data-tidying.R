library("tidyverse")
library("readxl")

timeperiods_data <- read_xlsx("data-raw/transit-data.xlsx", sheet = "info")
colnames(timeperiods_data) <- tolower(make.names(colnames(timeperiods_data)))


write_csv(timeperiods_data, "data/timeperiods_data.csv")
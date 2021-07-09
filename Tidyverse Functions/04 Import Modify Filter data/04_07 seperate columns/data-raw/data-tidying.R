library("tidyverse")
library("readxl")
library("lubridate")

transport_data <- read_xlsx("data-raw/transit-data.xlsx", sheet = "transport data", skip = 1)
colnames(transport_data) <- tolower(make.names(colnames(transport_data)))


write_csv(transport_data, "data/transport_data.csv")
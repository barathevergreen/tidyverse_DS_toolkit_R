library("tidyverse")
library("readxl")
library("lubridate")

transport_data <- read_xlsx("data-raw/transit-data.xlsx", sheet = "transport data", skip = 1)
colnames(transport_data) <- tolower(make.names(colnames(transport_data)))

transport_data <- transport_data %>%
  mutate(date = if_else(grepl("-", date), ymd(date), ymd("1900-01-01") + days(date))) %>%
  mutate(percent.of.all.items = 100 * number.of.items / sum(number.of.items))

transport_data <- transport_data %>%
  separate(sender.location, c("sender.country", "sender.city"), sep = ",", extra = "merge") %>%
  separate(receiver.location, c("receiver.country", "receiver.city"), sep = ",", extra = "merge") %>%
  separate(receiver.city, c("receiver.city", "receiver.state"), sep = "\\(", fill = "right") %>%
  mutate(receiver.state = gsub("\\)", "", receiver.state)) %>%
  separate(sender.city, c("sender.city", "sender.state"), sep = "\\(", fill = "right") %>%
  mutate(sender.state = gsub("\\)", "", sender.state))


write_csv(transport_data, "data/transport_data.csv")

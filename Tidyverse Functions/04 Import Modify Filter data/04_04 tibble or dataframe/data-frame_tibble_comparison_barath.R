library("tidyverse")

baseR_dataframe <- read.csv("data/timeperiods.csv")
baseR_dataframe

tidyverse_tibble <- read_csv("data/timeperiods.csv")
tidyverse_tibble


class(baseR_dataframe)
class(tidyverse_tibble)

transport_data = read_csv("data/transport-data.csv")

#unique column names



baseR_dataframe %>%
  group_by(time.period) %>%
  class()

baseR_dataframe[1,1] 
baseR_dataframe[1,2]

baseR_dataframe[,1]
baseR_dataframe[[1]]

tidyverse_tibble[,1]
tidyverse_tibble[[1]]


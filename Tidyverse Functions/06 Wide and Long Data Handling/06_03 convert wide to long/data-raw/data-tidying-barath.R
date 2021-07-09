library("tidyverse")

wide_monthly_tdiff <- read_csv("data-raw/wide_monthly_tdiff.csv")
wide_horses_data <- read_csv("data-raw/wide-horses.csv")
#ways of specifying columns : 1
wide_monthly_tdiff %>%
  gather(location,tdiff,
         
         bradford.tdiff,
         heathrow.tdiff,
         oxford.tdiff,
         stornoway.tdiff)
#2 range of columns
wide_monthly_tdiff %>%
  gather(location,tdiff,
         
         bradford.tdiff:stornoway.tdiff)

#3 using a column identifier
wide_monthly_tdiff %>%
  gather(location,tdiff,
         
         contains("tdiff"))

wide_horses_data %>%
  gather(country, year, horses,`Horses (per 100 people) in 1819`,`Horses (per 100 people) in 1820`) %>%
  view()

#when handling NOT TIDY columns:
wide_horses_data %>%
  gather(year, horses, 
         
         `Horses (per 100 people) in 1819`,
         `Horses (per 100 people) in 1820`,
         `Horses (per 100 people) in 1821`,
         `Horses (per 100 people) in 1822` ) %>%
  view()

#using contains
wide_horses_data %>%
  gather(year, horses, 
         
         contains("Horses") ) %>%
  view()

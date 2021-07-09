library("tidyverse")

british_weather <- read_csv("data/british_weather.csv")
#create new column tdiff 
british_weather <- british_weather %>%
  mutate(tdiff = tmax - tmin) %>%
  view()

#find the average tdiff using mean()
british_weather_vis<-british_weather %>%
  group_by(airport, mm) %>%
  summarise(avg.tdiff = mean(tdiff, na.rm = TRUE)) %>%
  view()

#visualization
british_weather_vis %>%
ggplot(aes(x=mm, y=avg.tdiff,
           color = airport)) +
  geom_point()

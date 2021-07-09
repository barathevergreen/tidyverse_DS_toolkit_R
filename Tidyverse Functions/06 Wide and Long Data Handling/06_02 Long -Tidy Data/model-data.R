library("tidyverse")
library("splines")
library("modelr")

monthly_tdiff <- read_csv("data/long_monthly_tdiff.csv")

#compartmentalize using nest()
by_airport <- monthly_tdiff %>% 
  group_by(airport) %>% 
  nest()  #%>%  #tidyr 
  #view()

#spline model
#with 5 degrees of freedom
#ns(x,df=) - natural splines - https://www.rdocumentation.org/packages/splines/versions/3.6.2/topics/ns
#lm(var1 ~ var2) - linear models - https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/lm
airport_model <- function(df) {
  lm(avg.tdiff ~ ns(month, df=5), data = df)
}
#to generate model of each group
#map(value, function){purrr} applying a function to each element and returning a vector the same length as the input
by_airport <- by_airport %>% 
  mutate(model = map(data, airport_model)) #%>% # purrr 
  #view()

#using map2 - map over multiple inputs
#https://www.rdocumentation.org/packages/purrr/versions/0.2.5/topics/map2
#applying model from 1 in map2
by_airport <- by_airport %>% 
  mutate(
    predictors = map2(data, model, add_predictions)
  )
by_airport #%>% view()
#unnest before visualize
#visualize actual and predicted values
#good to see one in scatter and one in line
#original data vs predicted model comparison:
unnest(by_airport,predictors) %>%
  ggplot() +
  geom_point(aes(x=month, y=avg.tdiff,
                 color = airport)) +
  geom_line(aes(x=month, y=pred,
                color = airport))




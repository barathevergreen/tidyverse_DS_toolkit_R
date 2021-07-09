library("gapminder")
library("tidyverse")

library("highcharter")

#create scenario from gapminder
gapminder %>%
  group_by(continent, year) %>%
  summarise(continent.population = sum(as.numeric(pop))) %>%
  #pipe with highcharter plot
  hchart("area",
         hcaes(x = year, 
               y = continent.population, 
               group = continent)
         ) %>%
  hc_plotOptions(area = list(stacking = "normal")) %>%
  hc_tooltip(shared = TRUE)

#create scenario for ggviolin and plotly(interactive)
gg_violin <- gapminder %>%
  filter(year == max(year),!continent == "Oceania") %>%
  ggplot(aes(x = continent, y = pop)) +
  geom_violin() + coord_flip() +
  geom_jitter(position = position_jitter(width = 0.05, height = 0),
              alpha = 1 / 4) +
  ggtitle(
    "Gapminder country population distribution, split by continent",
    subtitle = paste("for the year", max(gapminder$year))
  )
library(plotly)
ggplotly(gg_violin)

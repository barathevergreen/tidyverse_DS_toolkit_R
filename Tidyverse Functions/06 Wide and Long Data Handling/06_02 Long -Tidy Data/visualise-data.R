library("tidyverse")

wide_monthly_tdiff <- read_csv("data/wide_monthly_tdiff.csv") %>%
  view()

long_monthly_tdiff <- read_csv("data/long_monthly_tdiff.csv")%>%
  view()

#visualization of LONG through SCATTERPLOT
long_monthly_tdiff %>%
  ggplot(aes(x=month, y=avg.tdiff,
             color = airport)) +
  geom_point()

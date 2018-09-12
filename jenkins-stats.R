library(plotly)
library(tibble)
library(dplyr)
library(tidyr)
library(lubridate)

jenkins <- read.csv('./jenkins-stats.csv') %>%
  select(date,free,in.use) %>%
  gather(key = "variable", value = "value", -date)

jenkins$date <- as.POSIXct(jenkins$date)

p <- ggplot(data = jenkins, aes(x = date, y = value, group=variable, color=variable)) + 
  geom_line() +
  scale_x_datetime() +
  scale_color_discrete(name = "Variables",
                       breaks = c("Free", "In Use"))

g <- ggplotly(p, tooltip = c("x","y","colour")) %>%
  layout(title = "Jenkins Workers",
         #hovermode = 'compare',
         legend = (list(orientation = "v")
         ))

print(g)

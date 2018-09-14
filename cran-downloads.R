library(cranlogs)
library(plotly)

pkgs=c("dplyr", "checkLuhn","goodpractice", "BANEScarparkinglite")
pkgs=c(pkgs,"dplyr", "tidyverse", "stringi", "stringr", "ggplot2", "plotly")
pkgs=unique(pkgs)

stats <- cran_downloads(packages = pkgs, when = "last-month")

p <- ggplot(data = stats, aes(x = date, y = count, group=package, color=package)) + 
  geom_line() +
  #geom_point(shape="package") +
  #scale_shape_discrete(name = "Package") +
  scale_color_discrete(name = "Package") +
  scale_y_continuous(trans = "log10")

g <- ggplotly(p, tooltip = c("x","y","colour"), height = 450, width = 720) %>%
  layout(title = "Package Downloads",
         #hovermode = 'compare',
         legend = (list(orientation = "v"))
         ) 

print(g)
# api_create(g, filename = "cran-downloads")

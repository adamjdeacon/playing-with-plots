library(readr)
library(ggplot2)

d <- read_delim('./performance.txt', delim=" ", col_types = cols(
  time = col_character()
))

d$cpu <- as.numeric(d$cpu)
d$time <- as.POSIXct(paste0("2019-04-",d$day," ",d$time))

g <- ggplot(data=d, aes(x=time, y=cpu, group=process, color=process)) +
  geom_line(size=0.5) + 
  scale_color_discrete(name="process") +
  scale_x_datetime()

print(g)


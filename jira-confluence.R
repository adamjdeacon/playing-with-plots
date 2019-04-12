library(readr)

d <- read_delim('./performance.txt', delim=" ", col_types = cols(
  time = col_time(format = "%H:%M:%S")
))

d$cpu <- as.numeric(a$cpu)

g <- ggplot(data=d, aes(x=time, y=cpu, group=process, color=process)) +
  geom_line(size=0.5) + 
  scale_color_discrete(name="process") +
  scale_x_time()

print(g)


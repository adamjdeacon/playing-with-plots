library(lubridate)
library(readODS)
memory <- read_ods('./memory.ods')

plot_ly(data = memory, x = as_datetime(lubridate::today()) + as.numeric(memory$Time), 
        y = ~kbmemused, name = "Used Memory", type="scatter", mode="lines") %>%
  add_trace(y = ~kbmemfree, name = "Free Memory") %>%
  layout(title = "Memory Utilisation",
         xaxis = list(title="Date"),
         yaxis = list(title="Memory")
         )

plot_ly(data = memory, x = as_datetime(lubridate::today()) + as.numeric(memory$Time), 
        y = ~`%memused`,
        type="scatter", mode="lines")




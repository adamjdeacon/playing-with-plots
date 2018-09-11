json_file <- "http://vre343-ci-prod.mango.local/jenkins/metrics/B-8JmdqgDraRjyG5FJbmSxCDG1hcunSu-q7Zs7bbpFrFe3mMUjihXoCsc7X0WV0G/metrics"
json_data <- fromJSON(paste(readLines(json_file), collapse = ""))

json_data$gauges$jenkins.executor.count.value
json_data$gauges$jenkins.executor.free.value
json_data$gauges$`jenkins.executor.in-use.value`

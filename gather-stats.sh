#!/usr/bin/env bash

date=$(date +"%F %T")
stats=$(curl -s http://vre343-ci-prod.mango.local/jenkins/metrics/B-8JmdqgDraRjyG5FJbmSxCDG1hcunSu-q7Zs7bbpFrFe3mMUjihXoCsc7X0WV0G/metrics | jq -r '[.gauges["jenkins.executor.count.value"]["value"],.gauges["jenkins.executor.free.value"]["value"],.gauges["jenkins.executor.in-use.value"]["value"]] | @csv')

echo "${date},${stats}" >> /home/adeacon/code/graphs/jenkins-stats.csv

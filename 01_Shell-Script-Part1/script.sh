#!/bin/bash

# enable debugging in a script
set -x 

# print day, date, and time every second for 10 seconds
for i in {1..10}
do
  echo $(date) | awk -F " " '{print $1, $2, $3, $4}'
  sleep 1
done

# list all the buckets in AWS S3
# 'cut' to extract specific fields, 'grep' to find specific patterns
# aws s3 ls | cut -d " " -f 3 | grep -E ^www[.]
# echo "Hello, Welcome to DevSecOps!"

# To get the details of S3, we need to install AWS CLI and configure it first.
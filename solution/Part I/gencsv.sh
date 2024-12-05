#!/bin/bash

# Check for correct number of arguments
if [ "$#" -ne 2 ]; then
  echo "Usage: ./gencsv.sh <start_index> <end_index>"
  exit 1
fi

start=$1
end=$2

# Validate inputs
if ! [[ "$start" =~ ^[0-9]+$ && "$end" =~ ^[0-9]+$ && "$start" -le "$end" ]]; then
  echo "Not Valid arguments, Please enter both arguments are integers and start <= end."
  exit 1
fi

# Generate the file
> inputdata  # Clear existing content
for ((i = start; i <= end; i++)); do
  echo "$i, $((RANDOM % 1000))" >> inputdata
done

#!/bin/bash

start_time=$(date +%s)
sleep 10 &
end_time=$(date +%s)
echo "script executed in $(($end_time - $start_time)) seconds"

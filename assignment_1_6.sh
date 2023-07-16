#!/usr/bin/bash


mkdir -p cpu_logs


timestamp=$(date +%Y%m%d%H%M%S)
logfile="cpu_logs/cpu_usage_${timestamp}.log"


duration=$((5 * 60))  # 5 minutes in seconds
end_time=$((SECONDS + duration))

echo "Logging CPU usage for 5 minutes..."
echo "Timestamp, CPU Usage (%)" > "$logfile"

while [ $SECONDS -lt $end_time ]; do
  cpu_usage=$(top -bn1 | awk '/Cpu\(s\):/ {print $2}')
  current_time=$(date +%Y-%m-%d\ %H:%M:%S)
  echo "$current_time, $cpu_usage" >> "$logfile"
  sleep 10
done


echo "CPU usage logging completed."


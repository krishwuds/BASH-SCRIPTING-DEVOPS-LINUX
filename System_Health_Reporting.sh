#!/bin/bash

# System Health Check and Reporting Script

# Email configuration
 EMAIL="Krishwuds87@gmail.com"
 SUBJECT="System Alert"

# Function to print section headers
print_header() {
    echo "-----------------------------------------------------"
    echo " $1"
    echo "-----------------------------------------------------"
}

# Function to check CPU usage
check_cpu() {
    print_header "CPU Usage"
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/")
    echo "CPU Usage: ${cpu_usage}%"
}

# Function to check memory usage
check_memory() {
    print_header "Memory Usage"
    free -m
}

# Function to check disk space
check_disk() {
    print_header "Disk Space"
    df -h
}

# Function to check load average
check_load() {
    print_header "Load Average"
    uptime
}

# Function to check system uptime
check_uptime() {
    print_header "System Uptime"
    uptime -p
}

# Function to send email alert
send_alert() {
    echo "Warning: Resource utilization exceeds 90% on the system." | mail -s "$SUBJECT" "$TO_EMAIL"
}

# Main script execution
check_cpu
check_memory
check_disk
check_load
check_uptime

# Check resource utilization and send alert if exceeding 90%
if [[ $(df -h --output=pcent / | sed '2d;s/[^0-9]//g') -gt 90 ]]; then
    send_alert
fi

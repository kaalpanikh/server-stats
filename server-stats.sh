#!/bin/bash

# Function to display the current date and time
function current_date {
    echo "=== Current Date ==="
    date +"%A, %B %d, %Y, %I %p IST"
    echo ""
}

# Function to display OS version
function os_version {
    echo "=== OS Version ==="
    os_info=$(cat /etc/os-release)
    echo "$os_info"
    echo ""
}

# Function to display uptime
function uptime_info {
    echo "=== Uptime ==="
    uptime
    echo ""
}

# Function to display load average
function load_average {
    echo "=== Load Average ==="
    uptime | awk '{print $10, $11, $12}'
    echo ""
}

# Function to display logged in users
function logged_in_users {
    echo "=== Logged In Users ==="
    who
    echo ""
}

# Function to display failed login attempts
function failed_login_attempts {
    echo "=== Failed Login Attempts ==="
    sudo cat /var/log/auth.log | grep 'Failed password' | wc -l
    echo ""
}

# Function to calculate and display total CPU usage
function cpu_usage {
    echo "=== Total CPU Usage ==="
    cpu_info=$(grep 'cpu ' /proc/stat)
    user=$(echo $cpu_info | awk '{print $2}')
    nice=$(echo $cpu_info | awk '{print $3}')
    system=$(echo $cpu_info | awk '{print $4}')
    idle=$(echo $cpu_info | awk '{print $5}')
    
    total=$((user + nice + system + idle))
    used=$((user + nice + system))
    
    cpu_percentage=$((100 * used / total))
    
    echo "CPU Usage: $cpu_percentage%"
    echo ""
}

# Function to calculate and display total memory usage
function memory_usage {
    echo "=== Total Memory Usage ==="
    mem_info=$(free -m)
    
    total_mem=$(echo "$mem_info" | awk 'NR==2{print $2}')
    used_mem=$(echo "$mem_info" | awk 'NR==2{print $3}')
    
    free_mem=$((total_mem - used_mem))
    
    mem_percentage=$((100 * used_mem / total_mem))
    
    echo "Total Memory: ${total_mem}MB"
    echo "Used Memory: ${used_mem}MB"
    echo "Free Memory: ${free_mem}MB"
    echo "Memory Usage Percentage: ${mem_percentage}%"
    echo ""
}

# Function to calculate and display total disk usage
function disk_usage {
    echo "=== Total Disk Usage ==="
    disk_info=$(df -h /)
    
    used_disk=$(echo "$disk_info" | awk 'NR==2{print $3}')
    available_disk=$(echo "$disk_info" | awk 'NR==2{print $4}')
    
    total_disk=$(echo "$disk_info" | awk 'NR==2{print $2}')
    
    disk_percentage=$(echo "$disk_info" | awk 'NR==2{print $5}' | tr -d '%')
    
    echo "Total Disk Space: $total_disk"
    echo "Used Disk Space: $used_disk"
    echo "Available Disk Space: $available_disk"
    echo "Disk Usage Percentage: ${disk_percentage}%"
    echo ""
}

# Function to display top 5 processes by CPU usage
function top_cpu_processes {
    echo "=== Top 5 Processes by CPU Usage ==="
    ps aux --sort=-%cpu | head -n 6  # Display top 5 processes (including header)
}

# Function to display top 5 processes by memory usage
function top_memory_processes {
    echo "=== Top 5 Processes by Memory Usage ==="
    ps aux --sort=-%mem | head -n 6  # Display top 5 processes (including header)
}

# Main script execution starts here
clear  # Clear the terminal for better readability

# Call functions to display statistics
current_date
os_version
uptime_info
load_average
logged_in_users
failed_login_attempts
cpu_usage
memory_usage
disk_usage
top_cpu_processes
top_memory_processes

echo "=== End of Stats ==="

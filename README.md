# Server Stats Script

A comprehensive Bash script for monitoring and analyzing server performance metrics in real-time.

## Overview

This script provides system administrators and DevOps engineers with detailed insights into server performance and security metrics. It aggregates various system statistics into a single, easy-to-read output.

## Features

- **System Information**
  - OS Version
  - System Uptime
  - Load Average
  - Current Date and Time

- **Resource Monitoring**
  - CPU Usage Statistics
  - Memory Utilization
  - Disk Space Analysis
  - Top 5 Resource-Intensive Processes

- **Security Metrics**
  - Active User Sessions
  - Failed Login Attempts
  - Authentication Log Analysis

## Installation

1. Clone the repository:
```bash
git clone https://github.com/kaalpanikh/server-stats.git
```

2. Navigate to the project directory:
```bash
cd server-stats
```

3. Make the script executable:
```bash
chmod +x ./server-stats.sh
```

## Usage

Run the script with:
```bash
./server-stats.sh
```

## Requirements

- Linux-based operating system
- Bash shell (version 4.0 or higher)
- Root/sudo access for certain metrics

## Output Example

```plaintext
=== Current Date ===
Saturday, February 01, 2025, 02 PM IST

=== CPU Usage ===
Total CPU Usage: 45%

=== Memory Usage ===
Total Memory: 16384MB
Used Memory: 8192MB
Memory Usage: 50%
```

## Project Page

For more information about server monitoring and best practices, visit [roadmap.sh/projects/server-stats](https://roadmap.sh/projects/server-stats)
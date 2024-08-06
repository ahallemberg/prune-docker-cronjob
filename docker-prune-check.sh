#!/bin/bash

DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ $DISK_USAGE -gt 90 ]; then
    docker system prune -af
      
    echo "Docker pruned due to high disk usage: $DISK_USAGE%"
else
    echo "Disk usage is at $DISK_USAGE%. No action needed."
fi

#!/bin/bash

CURRENT_DIR=$(pwd)

sudo mv "$CURRENT_DIR/docker-prune-check.sh" /usr/local/bin/
sudo chmod +x /usr/local/bin/docker-prune-check.sh

# Add the script to crontab to run every minute
(crontab -l 2>/dev/null; echo "* * * * * /usr/local/bin/docker-prune-check.sh >> /var/log/docker-prune.log 2>&1") | crontab -

echo "Docker pruning script has been moved to /usr/local/bin/, made executable, and added to crontab to run every minute."

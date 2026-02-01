#!/bin/bash

LOG_DIR="var/log/myapp"
LOG_FILE="var/log/myapp/log_rotation.log"

if [ ! -d "$LOG_DIR" ]; then
  echo "[ $(date) ] ERROR: Log directory $LOG_DIR does not exist!" >> "$LOG_FILE"
  exit 1
fi

find "$LOG_DIR" -type f -name "*.log" -mtime +7 -mtime -30 ! -name "*.gz" \
  -exec gzip {} \; \
  -exec sh -c 'echo "[ $(date) ] compressed: $1" >> "'"$LOG_FILE"'"' sh {} \;

find "$LOG_DIR" -type f -name "*.gz" -mtime +30 \
  -exec rm -f {} \; \
  -exec sh -c 'echo "[ $(date) ] deleted: $1" >> "'"$LOG_FILE"'"' sh {} \;

echo "[ $(date) ] Log rotation completed successfully." >> "$LOG_FILE"


# crontab entry

sudo chmod +x  /usr/local/bin/log_rotaion.sh
ls -l /usr/local/bin/log_rotation.sh
cat /var/log/myapp/log_rotation.sh
# add a cron entry
sudo crontab -e
0 2 * * * /usr/local/bin/log_rotaion.sh
#cron format
# minute hour daily month weekday command
0 2 * * * /usr/local/bin/log_rotation.sh >> /var/log/myapp/cron.log 2>&1

# check cron status
systemctl status cron (ub/deb)
systemctl status crond (Rhel/centos)

#check logs
grep cron /sys/log/syslog
grep cron /var/log/cron


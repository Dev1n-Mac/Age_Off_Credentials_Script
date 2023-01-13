#!/bin/bash

# Set the number of months after which to disable user accounts
MONTHS_INACTIVE=6

# Get the current date
NOW=$(date +%s)

# Get the date that is 6 months ago
SIX_MONTHS_AGO=$(date -d "$MONTHS_INACTIVE months ago" +%s)

# Loop through all the users on the system
for user in $(cut -d: -f1 /etc/passwd); do
    # Skip the system users (System users are different from regular users and are skipped from the aging process)
    if [[ $user =~ ^(root|sync|halt|shutdown)$ ]]; then
        continue
    fi
    # Get the last login time of the user
    LAST_LOGIN=$(last -w -s $SIX_MONTHS_AGO -t $NOW -u $user | tail -n 1)

    # Check if the user has logged in within the past 6 months
    if [ -z "$LAST_LOGIN" ]; then
        # If the user has not logged in within the past 6 months, disable their account
        usermod -L $user
        echo "Disabled $user"
    fi
done

# This script will run on the 1st of June and December at 00:00
# You can put this script in a file such as "disable_inactive_users.sh", and then set up a cronjob (Job Scheduler in Linux) to run the script on a regular basis
# For example, Once every 6 months by running the command 'crontab -e'
# append the following line to that file 0 0 1 * * /path/to/disable_inactive_users.sh by running the command crontab -e in the terminal and adding "0 0 1 * * /path/to/disable_inactive_users.sh" to the bottom of the file

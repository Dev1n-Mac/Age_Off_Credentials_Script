# Age_Off_Credentials_Script
#This is a script to age off credentials on a linux server to maintain security. The goal of this script is to disable accounts after 6 months of inactivity to maintain security of this cloud server.
#This script will run on the 1st of June and December at 00:00
# You can put this script in a file such as "disable_inactive_users.sh", and then set up a cronjob (Job Scheduler in Linux) to run the script on a regular basis
# For example, Once every 6 months by running the command 'crontab -e'
# append the following line to that file 0 0 1 * * /path/to/disable_inactive_users.sh by running the command crontab -e in the terminal and adding "0 0 1 * * /path/to/disable_inactive_users.sh" to the bottom of the file

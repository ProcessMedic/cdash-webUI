#!/bin/bash
# PM Client Dashboard Server Updater Script
update="Preparing to update the server."
finished="Update finished. Exiting the script." 
logfile="~/logs/$(date).txt" 
logging="Logging to $logfile"
UPDATER="sudo apt-get update && sudo apt-get upgrade -y"
ERR_MSG="Whoops! Something went wrong. See $logfile for details."
updateServer() {
	$UPDATER	
}
err_ext() {
	echo $ERR_MSG
	sleep 1
	echo "Exiting..."
	exit
}
echo $logging
exec 1>$logfile 2>&1
echo "ProcessMedic Client Dashboard Server Updater" 
sleep 1
echo $update
updateServer || err_ext
echo "Done." 
sleep 1
echo $finished
exit

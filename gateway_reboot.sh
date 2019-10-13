#!/bin/bash

# This script will take a single commandline argument: the hostname of the target gateway to be rebooted.
# We will compare the argument against the contents of the user's .ssh/config file to determine if the gateway is listed.
# If the gateway is listed in .ssh/config, the we will continue with the reboot
# If it is not, we will notify the user that it needs to be configured before continuing and will exit the script at that point.
# 
# Ideally all gateways should be converted to passwordless ssh access similar to twb-an's current configuration.
# 
# /home/<username>/.ssh/config will need to be created for each user with each gateway's hostname.
#
# an example config file "config" is included with this script in it's repo. 
# Edit this file to reflect the current username and point to the proper keyfile with IdentityFile.

gateway="$1"
username=$(whoami)

#remove these echo statements when done testing
echo $gateway
echo $username

#test to see if the gateway name is NOT in the config file. If it's not, inform the user and exit the script.

if grep -Fxq "$gateway" /home/"$username"/.ssh/config ;
	then 
		echo "This gateway does not exist in .ssh/config. Please add an entry for "$gateway" to the file and re-run."
		exit 1
fi

read -p "Reboot gateway "$gateway"? (y/n)" -n 1 -r
echo
if [[ $REPLY=~ ^[Nn]$ ]]
	then 
	  	echo "No entered. Exiting."
		exit 1
fi

read -p "Are you sure? (y/n)" -n 1 -r
if [[ $REPLY=~ ^[Nn]$ ]]
        then
                echo "No entered. Exiting."
                exit 1
fi



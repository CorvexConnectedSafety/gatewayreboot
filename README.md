# gatewayreboot

This script will take a single commandline argument: the hostname of the target gateway to be rebooted.
We will compare the argument against the contents of the user's .ssh/config file to determine if the gateway is listed.
If the gateway is listed in .ssh/config, the we will continue with the reboot.
If it is not, we will notify the user that it needs to be configured before continuing and will exit the script at that point.
 
Ideally all gateways should be converted to passwordless ssh access similar to twb-an's current configuration.

/home/< username >/.ssh/config will need to be created for each user with each gateway's hostname.

An example config file "config" is included with this script in it's repo.
Edit this file to reflect the current username and point to the proper keyfile with IdentityFile.

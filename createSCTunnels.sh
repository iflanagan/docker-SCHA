#!/bin/bash 

# Author: Ian Flanagan Sauce Labs 2019

echo "starting script."
clear

# Define Variables 

DCURLEU="https://eu1.api.testobject.com/sc/rest/v1"
DCURLUS="https://us1.api.testobject.com/sc/rest/v1"
HEADLESSURL="https://us-east-1.saucelabs.com/rest/v1"

delay=2
sauceuser=$1
saucekey=$2
sauceenv=$3
sauceTunnelId=$4

#MYDIR=/tmp
MYDIR=/usr/local/sauce-connect
FILE=$MYDIR/bin/sc
MYCURRENTDIR=$(pwd)
LOGFILE=$MYCURRENTDIR/sauceconnect.log

if [ -e $LOGFILE ]; then

      echo "Deleting old log file:" $LOGFILE
      rm -rf $LOGFILE

else 

     echo "No Log file to delete.....proceed with the script."
fi 

if [ -e $FILE ]; then 
	echo "The Sauce Connect executable exists." $FILE

	if [ -n "$1" ] && [ -n "$2" ] & [ -n "$3" ] & [ -n "$4" ]  ; then
		   
		
			if [ $sauceenv == "Web" ]; then
  				echo "Create a tunnel on Web VM"
				sleep $delay
                		ulimit -n 8000; cd $MYDIR; bin/sc -u $1 -k $2 -i $4 --shared-tunnel --no-remove-colliding-tunnels -v -l $LOGFILE
			fi

			if [ $sauceenv == "EU" ]; then
                                echo "Create a tunnel on EU RDC"
				sleep $delay
		 		ulimit -n 8000; cd $MYDIR/bin; ./sc -u $1 -k $2 -x $DCURLEU -i $4 --shared-tunnel --no-remove-colliding-tunnels -v -l $LOGFILE
                        fi

			if [ $sauceenv == "US" ]; then
                                echo "Create a tunnel on US RDC"
				#echo "Sauce User: " $sauceuser
				#echo "Sauce Access Key: " $saucekey
				sleep $delay
				ulimit -n 8000; cd $MYDIR ; bin/sc -u $1 -k $2 -x $DCURLUS  -i $4 --shared-tunnel --no-remove-colliding-tunnels -v -l $LOGFILE 
                        fi

			if [ $sauceenv == "HEADLESS" ]; then
                                echo "Create a tunnel on Headless, with the following parameters"
				#echo "Sauce USer: " $sauceuser
				#echo "Sauce Access Key: " $saucekey
				#echo "Tunnel Id: " $sauceTunnelId
				echo "Headless endpoint: " $HEADLESSURL
                                sleep $delay
				ulimit -n 8000; cd $MYDIR; bin/sc -u $1 -k $2 -x https://us-east-1.saucelabs.com/rest/v1 -i $4 --shared-tunnel --no-remove-colliding-tunnels
                                # ulimit -n 8000; cd $MYDIR; bin/sc -u $1 -k $2 $HEADLESSURL -i $4 -v -l $LOGFILE
                        fi
		 
	else
  		echo "Syntax: ./script <sauceuser> <sauceaccesskey> <sauceENV: Web|EU|US|HEADLESS> <tunnelId>"
  		exit 1
	fi

else 
	echo "The file: " $FILE " doesnt exist."
	echo "use this link and download the latest version now."
	echo "https://wiki.saucelabs.com/display/DOCS/Sauce+Connect+Proxy"
	exit 1

fi 

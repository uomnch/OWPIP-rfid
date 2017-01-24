#!/bin/bash

#Launches the RFID Python program on startup
echo ###################### >> /var/log/owpip.log
date >> /var/log/owpip.log

#Use screen to open connection to Arduino
screen -dm /dev/ttyACM0 9600

sleep 5

#Kill screen
screen -ls | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill

#Run RFID program
cd /home/pi/Desktop/OWPIP-rfid
python owpip-rfid.py >> /var/log/owpip.log

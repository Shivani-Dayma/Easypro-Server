!/bin/bash

echo "terminating the existing session of EASYPRO-SERVERS"
echo "--------------------------------------------------"

PID=$(screen -ls | grep EASYPRO-SERVER | cut -d '.' -f1 | awk '{print $1}')
kill -9 $PID

echo "Current session has been terminated" /n

screen -wipe
echo "EASYPRO-SERVER IS STARTING PLEASE WAIT"
echo "-----------------------------------------------"


screen -dmS EASYPRO-SERVER rails s -p 9001 -b 192.168.10.10


echo "EASYPRO-SERVER IS STARTED SUCCESFULLY"

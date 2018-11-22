#! /bin/bash

TIME=$1

convertSecondsToMinutes() {
	hours=$(bc <<< "${TIME}/3600")
	minutes=$(bc <<< "(${TIME}%3600)/60")
	seconds=$(bc <<< "${TIME}%60")
	printf "%02d Hours, %02d Minutes, %05.2f Seconds\n" $hours $minutes $seconds
}

echo -n "The system will not sleep for "
convertSecondsToMinutes

caffeinate -u -t $TIME &


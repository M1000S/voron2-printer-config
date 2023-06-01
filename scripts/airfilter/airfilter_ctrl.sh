#!/bin/bash

cmd=$1

if [ $cmd = "power_on" ]; then
	#echo "power_on"
    wget -O /dev/null -q 'http://shelly1pm-ruckfan/relay/0?turn=on'
elif [ $cmd = "power_off" ]; then
	#echo "power_off"
    wget -O /dev/null -q 'http://shelly1pm-ruckfan/relay/0?turn=off'
elif [ $cmd = "keep_alive" ]; then
	#echo "keep_alive"
    wget -O /dev/null -q 'http://tasmota-ruckfan/cm?cmnd=script>FanReqOn=1'
else
	echo "invalid command"
fi

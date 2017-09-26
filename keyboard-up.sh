#!/bin/sh
  
if [ ! -f kbdvar.txt ]; then
        touch kbdvar.txt
        echo 0 > kbdvar.txt
fi

var=`cat kbdvar.txt`

if [ $var -gt "255" ]; then
        var=255
elif [ $var -lt "0" ]; then
        var=0
fi

let "var=var+12"
echo "$var" > kbdvar.txt

cat kbdvar.txt > /sys/class/leds/spi\:\:kbd_backlight/brightness

exit 0

#!/bin/sh

cd /opt/eclipse/kura/kura

S4_PORT_OPEN=`ls /sys/class/gpio/ | grep gpio26`

if [ -z "$S4_PORT_OPEN" ] ; then
        echo 26 > /sys/class/gpio/export && sleep 1 && echo out >/sys/class/gpio/gpio26/direction && sleep 1 && echo 0 >/sys/class/gpio/gpio26/value && sleep 1 && echo 1 >/sys/class/gpio/gpio26/value && sleep 1 && echo BB-UART4 > /sys/devices/platform/bone_capemgr/slots
fi

cd - > /dev/null

/opt/eclipse/kura/bin/start_kura.sh
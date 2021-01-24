#!/bin/sh

. /etc/reset-trackpoint-fix.conf

if [ -z "${DEVICE}" ]; then
  echo "*** No Trackpoint SerIO device specifed. Do nothing."
  exit 1
fi

for mode in none reconnect; do
  echo "- Put ${DEVICE} to '${mode}' state"
  echo -n ${mode} > /sys/bus/serio/devices/${DEVICE}/drvctl
done

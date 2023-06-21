#!/usr/local/bin/bash
# baraction.sh for spectrwm status bar

# ## DISK
hdd() {
  hdd="$(df -h | awk 'NR==4{print $3, $5}')"
  echo -e "HDD: $hdd"
}

# ## RAM
mem() {
  MEM=`sysctl -n hw.usermem`
  MEM_GB=$((MEM / 1024000000))
  echo -e "RAM: $MEM_GB GB"
}

# ## CPU
cpu() {
  CPU_FREQ=`sysctl -n dev.cpu.0.freq`
  echo -e "CPU: $CPU_FREQ MHz"
}

# ## BAT
bat(){
  IS_BATTERY=`sysctl -n hw.acpi.battery`

  if [ -z $IS_BATTERY ]
    then
      echo -e "no battery"
    else
      LIFE=`sysctl -n hw.acpi.battery.life`
      STATUS=`sysctl -n hw.acpi.battery.state`

      if [ $STATUS -eq 1 ]
      then
        ACTUAL_STATUS="discharge"
      else
        ACTUAL_STATUS="charge"
      fi

      echo -e "BAT: $LIFE% $ACTUAL_STATUS"
  fi
}

SLEEP_SEC=3  # set bar_delay = 5 in /etc/spectrwm.conf
# It seems that we are limited to how many characters can be displayed via
# the baraction script output. And the the markup tags count in that limit.
# So I would love to add more functions to this script but it makes the 
# echo output too long to display correctly.
while :; do
    echo "$(cpu) $(mem) $(bat)"

	sleep $SLEEP_SEC
done

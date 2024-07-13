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
  # CPU_FREQ=`sysctl -n dev.cpu.0.freq`
  # echo -e "CPU: $CPU_FREQ MHz"
  CPU_USAGE=`vmstat | awk 'FNR==3 {print $17}'`
  echo -e "CPU: $CPU_USAGE"
}

# ## BAT
bat(){
  BAT_PERCENT=`apm | awk -F: 'FNR==5 {print $2}'`
  BAT_STATUS=`apm | awk -F: 'FNR==4 {print $2}'`
  echo -e "BAT: $BAT_PERCENT $BAT_STATUS"
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

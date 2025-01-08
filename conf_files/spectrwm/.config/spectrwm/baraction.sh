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
  # for FreeBSD
  CPU_TEMP=`sysctl -n dev.cpu.0.temperature`

  # for OpenBSD
  # CPU_TEMP=`apm | awk 'FNR==3 {print $5 $6}'`

  echo -e "CPU: $CPU_TEMP"
}

# ## BAT
bat(){
  # for FreeBSD
  BAT_PERCENT=`apm | awk -F: 'FNR==5 {print $2}'`
  BAT_STATUS=`apm | awk -F: 'FNR==4 {print $2}'`

  # for OpenBSD
  # BAT_PERCENT=`apm | awk 'FNR==1 {print $4,$6,$7}'`
  # BAT_STATUS=`apm | awk 'FNR==2 {print $4,$5}'`

  echo -e "BAT: $BAT_PERCENT $BAT_STATUS"
}

SLEEP_SEC=3  # set bar_delay = 5 in /etc/spectrwm.conf
# It seems that we are limited to how many characters can be displayed via
# the baraction script output. And the the markup tags count in that limit.
# So I would love to add more functions to this script but it makes the 
# echo output too long to display correctly.
while :; do
    echo "$(cpu) $(mem)"
    # echo "$(bat)"

	sleep $SLEEP_SEC
done

DATE=$(date +'%Y-%m-%d %H:%M:%S')
BAT=$(cat /sys/class/power_supply/BAT0/capacity);

echo $BAT% \| $DATE

#!/bin/bash

HIGHLIGHT="#ffffff"

# Time / date function
clock() {
	TIME=$(date "+%H:%M")
	DATE=$(date "+%a %D")
	echo -n "%{F$HIGHLIGHT}$(printf '%b' "\uf017")%{F-} $TIME  %{F$HIGHLIGHT}$(printf '%b' "\uf073")%{F-} $DATE"
}

# Volume info function.
volume() {
	VOL=$(amixer get Master | grep % | sed -n 1p | awk -F '[' '{print $2}' | awk -F ']' '{print $1}')
	if [ $VOL = '0%' ]; then
		echo -n "%{F$HIGHLIGHT}$(printf '%b' "\uf026")%{F-} Mute"
	else
		echo -n "%{F$HIGHLIGHT}$(printf '%b' "\uf028")%{F-} $VOL"
	fi
}

# Wifi info function.
wifi() {
    echo -e "%{F$HIGHLIGHT} \uf1eb %{F-}$(iw wlp58s0 link | grep 'SSID' | cut -c 8-)"
}

# Workspace output function.
workspace() {
	workspacenext="A4:i3-msg workspace next_on_output:"
        workspaceprevious="A5:i3-msg workspace prev_on_output:"
        wslist=$(\
                wmctrl -d \
                | awk '/ / {print $2 $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20}' ORS=''\
                | sed -e 's/\s*  //g' \
                -e 's/\*[ 0-9A-Za-z]*[^ -~]*/  &  /g' \
                -e 's/\-[ 0-9A-Za-z]*[^ -~]*/%{F#3b3b4b}%{A:i3-msg workspace &:}  &  %{A}%{F#A0A0A0}/g' \
                -e 's/\*//g' \
                -e 's/ -/ /g' \
                )
        echo -n "%{$workspacenext}%{$workspaceprevious}$wslist%{A}%{A}"
}

# Battery output function.
bat() {
    status=$(cat /sys/class/power_supply/BAT0/status)
    capacity=$(cat /sys/class/power_supply/BAT0/capacity)

    if [ "$status" == "Charging" ]; then
        echo -e "%{F$HIGHLIGHT} \uf240 %{F-}$capacity%"
    elif (($capacity == 100)); then
        echo -e "%{F$HIGHLIGHT} \uf240 %{F-}$capacity%"
    elif (($capacity > 82)); then
        echo -e "%{F$HIGHLIGHT} \uf241 %{F-}$capacity%"
    elif (($capacity > 62)); then
        echo -e "%{F$HIGHLIGHT} \uf241 %{F-}$capacity%"
    elif (($capacity > 32)); then
        echo -e "%{F$HIGHLIGHT} \uf242 %{F-}$capacity%"
    elif (($capacity > 0)); then
        echo -e "%{F$HIGHLIGHT} \uf243 %{F-}$capacity%"
    else
        echo -e "%{F$HIGHLIGHT} \uf240 %{F-}$capacity%"
    fi
}

# Build the lemonbar output loop.
while true; do
	echo "$(clock) $(volume) $(bat) %{B-}%{c} $(workspace) %{r}%{B-} $(wifi) "
	sleep 2;
done |

# Run lemonbar.
lemonbar -p -B#111111 -F#A0A0A0 -g 1920x20 \
 -f "Hack:size=10" \
 -f "Font Awesome:size=13" \
 | zsh

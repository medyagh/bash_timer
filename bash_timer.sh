
timer() {
	arg1=$@
	number_part=${arg1//[!0-9]/}
	letter_part=${arg1//[^a-zA-Z]/}
	echo $letter_part

	#TODO: add min, hour lower and uppercase

	if [ "$letter_part" == "s" ]; then
		SECONDS_TO_COUNT_DOWN=$number_part
	fi
	if [ "$letter_part" == "m" ]; then
		SECONDS_TO_COUNT_DOWN=$(($number_part * 60))
	fi

	if [ "$letter_part" == "h" ]; then
		SECONDS_TO_COUNT_DOWN=$(($number_part * 60))
	fi

	coremsg="Your "$@"  is up."
	notifymsg="
       -------------------
       -------------------
       -------------------
       DING DING DING
       DING DING DING
       DING DING DING
       -------------------
       $coremsg
       -------------------
       DING DING DING
       DING DING DING
       DING DING DING
       -------------------
       -------------------
       -------------------
       "

	for i in $(seq $SECONDS_TO_COUNT_DOWN $END); do
		echo "$i/$@" >/tmp/timer.log
		sleep 1
	done

	# Linux
	path_to_notify_send=$(which notify-send)
	if [ -x "$path_to_notify_send" ]; then
		notify-send "Medya Timer" "$notifymsg" -u normal
	fi

	path_to_xmessage=$(which xmessage)
	if [ -x "$path_to_xmessage" ]; then
		xmessage "$notifymsg" -nearmouse
	else
		path_to_zenity=$(which zenity)
		if [ -x "$path_to_zenity" ]; then
			zenity --warning --name "Medya Bash Timer" --text="$coremsg" >/dev/null 2>&1
		fi

	fi

	#
	# For MacOs
	# TODO use the coremsg for MacOs
	#

	path_to_osascript=$(which osascript)
	if [ -x "$path_to_osascript" ]; then
		osascript -e 'display notification "Ding Ding Ding Your time is up !" with title "Medya Timer"'
		osascript -e 'tell app "System Events" to display dialog "Your time is up !"'
	fi
}

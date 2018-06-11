 timer () {
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
     sleep "$@";
     #TODO check if these are installed before running them
     notify-send "Medya Timer" "$notifymsg" -u normal;
     zenity --name "Medya Bash Timer" --scale --value="$@" --max-value="$@" --text="$coremsg"  > /dev/null 2>&1;
 
     #TODO test on other distros other than debian
  }

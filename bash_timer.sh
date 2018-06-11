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
     zenity --warning --name "Medya Bash Timer" --text="$coremsg"  > /dev/null 2>&1;
 
     #TODO test on other distros other than debian
  }

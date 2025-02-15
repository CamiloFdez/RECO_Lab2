#!/bin/bash

echo Hello! in this menu you can review log files
echo Please select an option

log_review() {
    clear
    echo "--------------------------------"
    echo "      Shell Script Menu         "              
    echo "--------------------------------"
    echo "Select a log file to view:"
    echo "1. syslog"
    echo "2. auth.log"
    echo "3. dmesg"
    echo "4. Filter by contains"
    echo "5. Exit"

    read option
    
    case $option in
        1) # syslog
            clear
            tail -n 15 /var/log/syslog | less
            pause
            ;;
        2) # auth.log
            clear
            tail -n 15 /var/log/auth.log | less
            pause
            ;;
        3) # dmesg
            clear
            tail -n 15 /var/log/dmesg | less
            pause
            ;;
        4) # Filter by contains
            clear
            echo "Enter the string to search for:"
            read contains_str
            grep -r "$contains_str" /var/log | less
            pause
            ;;
        5) # Exit
            exit 0
            ;;
        *)
            echo "Invalid option!"
            ;;
    esac
}
log_review

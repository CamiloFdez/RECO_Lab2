#!/bin/bash

echo Hello! in this menu you can access to information of files directory with more options
echo Please select a directory and chose an option 

list_files() {
    echo "Enter the directory to analyze:"
    read directory
    if [[ -z "$direcrory" || ! -d "$directory" ]]; then
        echo "Invalid directory"
        exit 1
    fi

    echo "Do you want to include subdirectories? (y/n)"
    read subdirs
    if [[ "$subdirs" == "y" ]]; then
        directory="$directory/*"
    else
        directory="$directory"
    fi

    while true; do
        clear
        echo "--------------------------------"
        echo "      Shell Script Menu         "              
        echo "--------------------------------"
        echo "Select an option:"
        echo "1. Filter by starts with"
        echo "2. Filter by ends with"
        echo "3. Filter by contains"
        echo "4. Exit"
        
        read option
        
        case $option in
            1) # Starts with a given string
                clear
                echo "Enter the files that start with:"
                read start_str                
                find $directory -name "$start_str*" | less 
                read -p  "Press enter to continue"
                ;;
            2) # Ends with a given string
                clear
                echo "Enter the string to end with:"
                read end_str
                find $directory -name "*$end_str" | less
                read -p  "Press enter to continue"
                ;;
            3) # Contains a given string
                clear
                echo "Enter the string to search for:"
                read contains_str
                find $directory -name "*$contains_str*" | less
                read -p  "Press enter to continue"
                ;;
            4) # Exit
                exit 0
                ;;
            *)
                echo "Invalid option!"
                ;;
        esac
    done
}
list_files

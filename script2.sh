#!/bin/bash

echo Hello! in this menu you can search for files and words in files
echo Please select an option

search_files() {
    while true; do
        clear
        echo "--------------------------------"
        echo "      Shell Script Menu         "              
        echo "--------------------------------"
        echo "Select an option:"
        echo "1. Search for a file by name"
        echo "2. Search for a word in a file"
        echo "3. Search for a word in a file after finding it"
        echo "4. Count the number of lines in a file"
        echo "5. Display the first n lines of a file"
        echo "6. Display the last n lines of a file"
        echo "7. Exit"

        read option
        
        case $option in
            1) # Search for file by name
                clear
                echo "Enter directory to search:"
                read directory
                if [[ -z "$directory" || ! -d "$directory" ]]; then
                    echo "Invalid directory, the directory does not exist"
                    pause
                    continue
                fi
                echo "Enter file name (or part of it):"
                read filename
                echo "Searching for files with name containing: $filename"
                result=$(find $directory -type f -name "*$filename*")
                count=$(echo "$result" | wc -l)
                echo "Found $count files:"
                echo "$result"
                pause
                read -p  "Press enter to continue"
                ;;
            2) # Search for a word in a file
                clear
                echo "Enter file path:"
                read file_path
                if [[ ! -f "$file_path" ]]; then
                    echo "Invalid file path, the file does not exist"
                    pause
                    continue
                fi
                echo "Enter word to search:"
                read word
                grep -n "$word" $file_path | tee /dev/tty | wc -l
                count=$(grep -n "$word" $file_path | wc -l)
                echo "Found $count occurrences of the word: $word"
                pause
                read -p  "Press enter to continue"
                ;;
            3) # Search for word in a file after finding it
                clear
                echo "Enter directory to search:"
                read directory
                if [[ -z "$directory" || ! -d "$directory" ]]; then
                    echo "Invalid directory, the directory does not exist"
                    pause
                    continue
                fi
                echo "Enter file name (or part of it):"
                read filename
                result=$(find $directory -type f -name "*$filename*")
                if [[ -z "$result" ]]; then
                    echo "No files found with name containing: $filename"
                    pause
                    continue
                fi
                count=$(echo "$result" | wc -l)
                echo "Enter word to search:"
                read word
                for file in $result; do
                    echo "File: $file"
                    grep -n "$word" "$file" | tee /dev/tty | wc -l
                    occ = $(grep -n "$word" "$file" | wc -l)
                    echo "Found $occ occurrences of the word: $word"
                done
                pause                           
                ;;
            4) # Count the number of lines in a file
                clear
                echo "Enter file path:"
                read file_path
                if [ -f "$file_path"]; then
                    lines=$(wc -l < $file_path)
                    echo "Number of lines in the file: $lines"
                else
                    echo "Invalid file path, the file does not exist"
                fi
                pause
                ;;
            5) # Display the first n lines of a file
                clear
                echo "Enter file path:"
                read file_path
                if [[ ! -f "$file_path" ]]; then
                    echo "Invalid file path, the file does not exist"
                    pause
                    continue
                fi
                echo "Enter number of lines:"
                read n
                head -n $n $file_path | cat 
                pause
                ;;
            6) # Display the last n lines of a file
                echo "Enter file path:"
                read file_path
                if [[ ! -f "$file_path" ]]; then
                    echo "Invalid file path, the file does not exist"
                    pause
                    continue
                fi
                echo "Enter number of lines:"
                read n
                tail -n $n $file_path | cat
                pause
                ;;
            7) # Exit
                exit 0
                ;;
            *)
                echo "Invalid option!"
                ;;
        esac
    done
}
search_files

# !bin/sh

echo Hello! in this menu you can access to information of files directory 
echo Please select a directory and chose an option

list_files() {
    echo "Enter the directory to analyze:"
    read directory

    # Display menu with options
    while true; do
        clear
        echo "--------------------------------"
        echo "      Shell Script Menu         "              
        echo "--------------------------------"
        echo "Select an option:"
        echo "1. Most recent files"
        echo "2. Oldest files"
        echo "3. Size from largest to smallest"
        echo "4. Size from smallest to largest"
        echo "5. File type (File/Directory)"
        echo "6. Exit"
        
        read option
        
        case $option in
            1) # Most recent files
                clear
                echo "Most recent files:"
                ls -lSh $directory | grep -v '^total' | awk '{print $6, $7, $8, $9}' | uniq -c
                read -p  "Press enter to continue"
                ;;
            2) # Oldest files
                clear
                echo "Oldest files:"
                ls -ltr $directory | grep -v '^total' | awk '{print $6, $7, $8, $9}' | uniq -c
                read -p  "Press enter to continue"
                ;;
            3) # Size from largest to smallest
                clear
                echo "Files sorted by size (largest to smallest):"
                ls -lS $directory 
                read -p  "Press enter to continue"
                ;;
            4) # Size from smallest to largest
                clear
                echo "Files sorted by size (smallest to largest):"
                ls -lSr $directory 
                read -p  "Press enter to continue"
                ;;
            5) # File type (File/Directory)
                clear
                echo "Files and directories:"
                file_count=$(ls -lF $directory | grep -v '/$' | wc -l)
                dir_count=$(ls -lF $directory | grep '/$' | wc -l)
                echo "Total files: $file_count"
                echo "Total directories: $dir_count"
                ls -lF $directory 
                read -p  "Press enter to continue"
                ;;
            6) # Exit
                exit 0
                ;;
            *)
                echo "Invalid option!"
                ;;
        esac
    done
}
list_files

#!/bin/bash

create_user() {
    echo "Enter username:"
    read username
    echo "Enter group name:"
    read groupname
    echo "Enter full name:"
    read fullname
    echo "Enter home directory:"
    read homedir
    echo "Enter shell (e.g., /bin/bash):"
    read shell
    echo "Enter user permissions (e.g., 700, 770, 755):"
    read permissions

    # Create group
    sudo groupadd $groupname

    # Create user
    sudo useradd -m -d $homedir -s $shell -G $groupname -c "$fullname" $username

    # Set permissions
    sudo chmod $permissions $homedir

    echo "User $username created successfully."
}
create_user

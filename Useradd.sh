#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root or with sudo."
    exit 1
fi

# Function to add a new user
add_user() {
    read -p "Enter the username: " username
    read -p "Enter the full name of the user: " full_name
    read -s -p "Enter the password for the user: " password

    echo
    useradd -m -c "$full_name" "$username"  # -m creates the user's home directory
    echo "$username:$password" | chpasswd  # Set the password for the user

    # You can add additional user configuration or commands here if needed
    # For example, setting up SSH keys, creating user groups, etc.
    
    echo "User '$username' has been created."
}

# Call the function to add a user
add_user

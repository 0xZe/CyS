#!/bin/bash

# Input file containing user data
input_file="users.txt"

# Function to check if an email address is FQDN
is_fqdn_email() {
    local email="$1"
    # Use regex to validate an FQDN email address
    if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then  #regax explain ???????????????
        return 0 # Email is valid
    else
        return 1 # Email is invalid
    fi
}

# Process each line of the input file
while IFS=',' read -r name email id; do
    # Trim leading/trailing spaces
    name=$(echo "$name" | xargs)
    email=$(echo "$email" | xargs)
    id=$(echo "$id" | xargs)

    # Skip if ID is missing or invalid, showing a warning
    if [[ -z "$id" || ! "$id" =~ ^[0-9]+$ ]]; then
        echo "Warning: Invalid ID for user $name" >&2
        continue
    fi

    # Skip if the email is invalid, showing a warning
    if ! is_fqdn_email "$email"; then
        echo "Warning: Invalid email for user $name" >&2
        continue
    fi

    # Check if ID is even or odd and print the message
    if (( id % 2 == 0 )); then
        echo "The $id of $email is an even number."
    else
        echo "The $id of $email is an odd number."
    fi
done < "$input_file"

#!/bin/bash

# This script monitors and restarts the Unified Remote process if it stops working

# Define variables for the process name and the command to restart it
process="urserver"
restart="/opt/urserver/urserver-start --no-manager"

# Enter an infinite loop
while true; do
    # Check if the process is running using the pidof command
    if ! pidof "$process" > /dev/null; then
        # Print a message to the standard error stream
        echo "Unified Remote is not running. Restarting..." >&2

        # Restart the process and capture the output
        output=$($restart 2>&1)

        # Check if the restart command was successful
        if [ $? -eq 0 ]; then
            # Print a message to the standard output stream
            echo "Unified Remote restarted."
        else
            # Print an error message and the output of the restart command to the standard error stream
            echo "Failed to restart Unified Remote. Output:" >&2
            echo "$output" >&2
        fi
    fi

    # Pause for 2 seconds using a variable
    interval=2
    sleep "$interval"
done

#!/bin/bash

IPSET_LIST="allowed_ips"
CONFIG_FILE="/etc/ipset.rules"

# Flush the current list to start fresh
ipset flush "$IPSET_LIST"

# Read each line from the configuration file
while IFS= read -r line; do
    # Skip empty lines and lines starting with '#'
    if [[ -z "$line" || "$line" =~ ^# ]]; then
        continue
    fi
    # Add the IP address to the ipset list
    ipset add "$IPSET_LIST" "$line"
done < "$CONFIG_FILE"

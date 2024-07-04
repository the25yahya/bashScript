#!/bin/bash

# Prompt user for CIDR notation
echo "Enter the target network in CIDR notation (e.g., 192.168.0.0/24):"
read target_cidr

# Validate CIDR format (basic check)
if ! [[ $target_cidr =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\/[0-9]{1,2}$ ]]; then
  echo "Invalid CIDR format. Please try again."
  exit 1
fi

# Extract network address and prefix from CIDR
network_address=$(echo $target_cidr | cut -d "/" -f 1)
cidr_prefix=$(echo $target_cidr | cut -d "/" -f 2)

# Scan for open port 80 (HTTP) on the specified network
nmap -sT $network_address/$cidr_prefix -p 80 -oG HTTPscan

# Extract open port 80 IPs and loop through results
hosts_with_http=$(grep open HTTPscan | cut -d " " -f 2)

# Print results for each host found
if [[ $hosts_with_http ]]; then
  echo "HTTP service detected on:"
  for host in $hosts_with_http; do
    echo "  $host"
  done
else
  echo "No hosts with open port 80 (HTTP) found on the specified network."
fi

# Clean up temporary file
rm HTTPscan

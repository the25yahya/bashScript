#!/bin/bash

# Color variables
RED='\e[31m'
NC='\e[0m' # No Color (reset)

# Print the header with equal signs and "System Info" in red
echo -e "$(printf '=%.0s' {1..30})* System Info *$(printf '=%.0s' {1..30})"
kernel_name=$(uname -s)
nodename=$(uname -n)
operating_system=$(uname -o)
hardware_platform=$(uname -i)
echo -e "${RED}Kernel Name = $kernel_name${NC}"
echo -e "${RED}Node Name = $nodename${NC}"
echo -e "${RED}Operating System = $operating_system${NC}"
echo -e "${RED}Hardware Platform = $hardware_platform${NC}"
echo ""
echo ""
echo -e "$(printf '=%.0s' {1..30})* CPU *$(printf '=%.0s' {1..30})"
lscpu | while read line; do echo -e "${RED}$line${NC}"; done
echo ""
echo ""
echo -e "$(printf '=%.0s' {1..30})* memory *$(printf '=%.0s' {1..30})"
free -h | while read line; do echo -e "${RED}$line${NC}"; done

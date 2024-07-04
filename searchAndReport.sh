#!/bin/bash

Domain=$1
Directory=${Domain}_recon

echo "Creating directory $Directory"

mkdir -p Directory

nmap_scan(){
    nmap $Domain > $Directory/nmap
    echo "The results of the nmap scan are stored in $Directory/nmap"
}

dirsearch_scan(){
    dirsearch -u https://www.$Domain -e php --simple-report=$Directory/dirsearch
    echo "The results of dirsearch scan are store in $Directory/dirsearch"
}
crt_scan(){
    curl "https://crt.sh/q=$Domain&output=json" -o $Directory/crt
    echo the results of the crt scan are stored in $Directory/crt
}

case $2 in 
 "nmap")
    nmap_scan
    ;;
 "dirseach")
    dirsearch_scan
    ;;
 "crt")
    crt_scan
    ;;
 *)
  nmap_scan
  dirsearch_scan
  crt_scan
  ;;
esac
echo "Generating recon report from output files"
Today=$(date)
echo "This scan was created on $Today" > $Directory/report
echo "Results for nmap" >> $Directory/report
grep -E "^\s*\S+\s+\S+\s+\S+\s*$" $Directory/nmap >> $Directory/report
echo "Results for dirsearch" >> $Directory/report
cat "$Directory/dirsearch" >> $Directory/report
echo "Results for cert.sh" >> $Directory/report

jq -r ".[] | name_value" $Directory/crt >> $Directory/report 

    
 

#!/bin/bash
# USE: ./recon.sh  domain.ru
. ./src/fDirCreate.sh
. ./src/fReconDns.sh
. ./src/fReconWhois.sh
. ./src/fReconIcmp.sh

targetDomain=$1

# CREATE DIR
workPath=$(CreateDir $targetDomain)

# RECON ICMP
ipv4=$(ReconIcmp $targetDomain $workPath)

# RECON WHOIS
route=$(ReconWhois $ipv4 $workPath)

# RECON DNS
ReconDns $targetDomain $workPath

# SCAN NMAP
proxychains nmap -sV -T5 --dns-servers 8.8.8.8 -v -iL $workPath'/hosts_ipv4.lst' -oA $workPath'/scan_nmap'

# ANALYSE
searchsploit --nmap $workPath'/scan_nmap.xml' > $workPath'/anaylyse_searchsploit.txt'

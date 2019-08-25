function ReconDns() {
    dnsrecon -d $1 -asgw --xml $2'/dns_dnsrecon.xml';
    grep -oP "([0-9]{1,3}\.){3}[0-9]{1,3}" $2'/dns_dnsrecon.xml' >> $2'/hosts_ipv4.lst';
    sort -t . -k 3,3n -k 4,4n $2'/hosts_ipv4.lst' >> $2'/hosts_ipv4.lst'
}

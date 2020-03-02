function ReconDns() {
    nmap -T4 -p 53 --script dns-brute $1 > $2'/dns_nmap.txt';
    grep -oP "([0-9]{1,3}\.){3}[0-9]{1,3}" $2'/dns_nmap.txt' >> $2'/hosts_ipv4.lst';
    sort -t . -k 3,3n -k 4,4n $2'/hosts_ipv4.lst' >> $2'/hosts_ipv4.lst'
    
    fierce --domain kvado.ru > $2'/dns_fierce.txt';
    grep -oP "([0-9]{1,3}\.){3}[0-9]{1,3}" $2'/dns_fierce.txt' >> $2'/hosts_ipv4.lst';
    sort -t . -k 3,3n -k 4,4n $2'/hosts_ipv4.lst' >> $2'/hosts_ipv4.lst'
    
    #dnsrecon -d $1 -n 8.8.8.8 -asgw --xml $2'/dns_dnsrecon.xml';
    #grep -oP "([0-9]{1,3}\.){3}[0-9]{1,3}" $2'/dns_dnsrecon.xml' >> $2'/hosts_ipv4.lst';
    #sort -t . -k 3,3n -k 4,4n $2'/hosts_ipv4.lst' >> $2'/hosts_ipv4.lst'
}

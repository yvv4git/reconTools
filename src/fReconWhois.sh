function ReconWhois() {
    whois $1 > $2'/whois.txt'
    route=$(whois $1 | grep route| awk '{print $2}')
    python src/cidr2ip.py $route >> $2'/hosts_ipv4.lst'
    echo $route
}

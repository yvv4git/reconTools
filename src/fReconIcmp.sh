function ReconIcmp() {
    ipv4=$(ping -c1 $1 | grep -oP "([0-9]{1,3}\.){3}[0-9]{1,3}" |uniq)
    echo $ipv4 >> $2'/hosts_ipv4.lst'
    echo $ipv4
}

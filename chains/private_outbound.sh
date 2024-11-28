# private_outbound chain

# private network ranges
$IPT -A private_outbound -p ALL -d 10.0.0.0/8 -j DROP
$IPT -A private_outbound -p ALL -d 172.16.0.0/12 -j DROP
$IPT -A private_outbound -p ALL -d 192.168.0.0/16 -j DROP

# TEST-NET documentation ranges
$IPT -A private_outbound -p ALL -d 192.0.2.0/24 -j DROP
$IPT -A private_outbound -p ALL -d 198.51.100.0/24 -j DROP
$IPT -A private_outbound -p ALL -d 203.0.113.0/24 -j DROP

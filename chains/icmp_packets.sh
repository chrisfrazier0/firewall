# icmp_packets chain

# ICMP packets should fit in a Layer 2 frame, thus they should never be fragmented.
$IPT -A icmp_packets --fragment -p ICMP -j DROP

# Allow echo reply and time exceeded
$IPT -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT
$IPT -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT

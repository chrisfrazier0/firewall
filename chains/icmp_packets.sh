# icmp_packets chain

# ICMP packets should fit in a Layer 2 frame, thus they should
# never be fragmented. Fragmented ICMP packets are a typical sign
# of a denial of service attack.
$IPT -A icmp_packets --fragment -p ICMP -j DROP

# Echo
$IPT -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j DROP
# $IPT -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT

# Time Exceeded
$IPT -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j DROP
# $IPT -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT

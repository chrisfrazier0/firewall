# bad_packets chain

# Drop packets received on the external interface claiming a source of the local network
$IPT -A bad_packets -p ALL -i $INET_IFACE -s $LOCAL_NET -j LOG --log-prefix "Illegal source: "
$IPT -A bad_packets -p ALL -i $INET_IFACE -s $LOCAL_NET -j DROP

# Drop INVALID packets immediately
$IPT -A bad_packets -p ALL -m state --state INVALID -j LOG --log-prefix "Invalid packet: "
$IPT -A bad_packets -p ALL -m state --state INVALID -j DROP

# Then check the tcp packets for additional problems
$IPT -A bad_packets -p tcp -j bad_tcp_packets

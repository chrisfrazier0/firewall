# bad_tcp_packets chain

# Trust internal network, return
$IPT -A bad_tcp_packets -p tcp -i $LOCAL_IFACE -j RETURN

# Every new connection attempt should begin with a syn packet. If it doesn't, it is likely a port scan.
# This drops packets in state NEW that are not flagged as syn packets.
$IPT -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG --log-prefix "New not syn: "
$IPT -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

# Drop packets that are part of a stealth port scan
$IPT -A bad_tcp_packets -p tcp --tcp-flags ALL NONE -j LOG --log-prefix "Stealth scan: "
$IPT -A bad_tcp_packets -p tcp --tcp-flags ALL NONE -j DROP
$IPT -A bad_tcp_packets -p tcp --tcp-flags ALL ALL -j LOG --log-prefix "Stealth scan: "
$IPT -A bad_tcp_packets -p tcp --tcp-flags ALL ALL -j DROP
$IPT -A bad_tcp_packets -p tcp --tcp-flags ALL FIN,URG,PSH -j LOG --log-prefix "Stealth scan: "
$IPT -A bad_tcp_packets -p tcp --tcp-flags ALL FIN,URG,PSH -j DROP
$IPT -A bad_tcp_packets -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j LOG --log-prefix "Stealth scan: "
$IPT -A bad_tcp_packets -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j DROP
$IPT -A bad_tcp_packets -p tcp --tcp-flags SYN,RST SYN,RST -j LOG --log-prefix "Stealth scan: "
$IPT -A bad_tcp_packets -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
$IPT -A bad_tcp_packets -p tcp --tcp-flags SYN,FIN SYN,FIN -j LOG --log-prefix "Stealth scan: "
$IPT -A bad_tcp_packets -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP

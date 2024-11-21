# bad_tcp_packets chain

# Trust internal network
if [ "$LOCAL_IFACE" != "" ] && [ "$LOCAL_TRUST" = "true" ]; then
    $IPT -A bad_tcp_packets -p TCP -i $LOCAL_IFACE -j RETURN
fi

# Every new connection attempt should begin with a syn packet. If it doesn't, it is likely a port scan.
# This drops packets in state NEW that are not flagged as syn packets.
if [ "$LOG_DROPS" = "true" ]; then
    $IPT -A bad_tcp_packets -p TCP ! --syn -m state --state NEW -j LOG --log-prefix "New not syn: "
fi
$IPT -A bad_tcp_packets -p TCP ! --syn -m state --state NEW -j DROP

# Drop packets with invalid TCP flags
if [ "$LOG_DROPS" = "true" ]; then
    $IPT -A bad_tcp_packets -p TCP --tcp-flags ALL NONE -j LOG --log-prefix "Stealth scan: "
    $IPT -A bad_tcp_packets -p TCP --tcp-flags ALL ALL -j LOG --log-prefix "Stealth scan: "
    $IPT -A bad_tcp_packets -p TCP --tcp-flags ALL FIN,URG,PSH -j LOG --log-prefix "Stealth scan: "
    $IPT -A bad_tcp_packets -p TCP --tcp-flags ALL SYN,RST,ACK,FIN,URG -j LOG --log-prefix "Stealth scan: "
    $IPT -A bad_tcp_packets -p TCP --tcp-flags SYN,RST SYN,RST -j LOG --log-prefix "Stealth scan: "
    $IPT -A bad_tcp_packets -p TCP --tcp-flags SYN,FIN SYN,FIN -j LOG --log-prefix "Stealth scan: "
fi
$IPT -A bad_tcp_packets -p TCP --tcp-flags ALL NONE -j DROP
$IPT -A bad_tcp_packets -p TCP --tcp-flags ALL ALL -j DROP
$IPT -A bad_tcp_packets -p TCP --tcp-flags ALL FIN,URG,PSH -j DROP
$IPT -A bad_tcp_packets -p TCP --tcp-flags ALL SYN,RST,ACK,FIN,URG -j DROP
$IPT -A bad_tcp_packets -p TCP --tcp-flags SYN,RST SYN,RST -j DROP
$IPT -A bad_tcp_packets -p TCP --tcp-flags SYN,FIN SYN,FIN -j DROP

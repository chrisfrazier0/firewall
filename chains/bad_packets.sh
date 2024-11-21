# bad_packets chain

# Drop packets received on the external interface claiming a source of the local network
if [ "$INET_IFACE" != "" ] && [ "$LOCAL_IFACE" != "" ]; then
    if [ "$LOG_DROPS" = "true" ]; then
        $IPT -A bad_packets -p ALL -i $INET_IFACE -s $LOCAL_NET -j LOG --log-prefix "Illegal source: "
    fi
    $IPT -A bad_packets -p ALL -i $INET_IFACE -s $LOCAL_NET -j DROP
fi

# Drop INVALID packets immediately
if [ "$LOG_DROPS" = "true" ]; then
    $IPT -A bad_packets -p ALL -m state --state INVALID -j LOG --log-prefix "Invalid packet: "
fi
$IPT -A bad_packets -p ALL -m state --state INVALID -j DROP

# Then check the tcp packets for additional problems
$IPT -A bad_packets -p TCP -j bad_tcp_packets

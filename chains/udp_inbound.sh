# udp_inbound chain

# Drop netbios calls
$IPT -A udp_inbound -p UDP -s 0/0 --dport 137 -j DROP
$IPT -A udp_inbound -p UDP -s 0/0 --dport 138 -j DROP

# Dynamic Address
# If DHCP, the initial request is a broadcast. The response doesn't exactly match the
# outbound packet. This explicitly allows the DHCP ports to alleviate this problem.
# $IPT -A udp_inbound -p UDP -s 0/0 --sport 67 --dport 68 -j ACCEPT

# mosh
$IPT -A udp_inbound -p UDP -s 0/0 --dport 60000:61000 -j ACCEPT

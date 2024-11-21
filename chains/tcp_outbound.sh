# tcp_outbound chain

# http(s)
# $IPT -A tcp_outbound -p TCP -d 0/0 --dport 80 -j ACCEPT
# $IPT -A tcp_outbound -p TCP -d 0/0 --dport 443 -j ACCEPT

# tcp_inbound chain

# sshd
$IPT -A tcp_inbound -p TCP -s 0/0 --dport 22 -j ACCEPT

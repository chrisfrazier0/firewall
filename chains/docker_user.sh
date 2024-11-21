# DOCKER-USER chain

# Filter outbound traffic from the containers
$IPT -A DOCKER-USER -p TCP -s $DOCKER_NET -j tcp_outbound
$IPT -A DOCKER-USER -p UDP -s $DOCKER_NET -j udp_outbound

# If not filtered, accept all other outbound traffic
$IPT -A DOCKER-USER -p ALL -s $DOCKER_NET -j ACCEPT

# Accept related/established connections
$IPT -A DOCKER-USER -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# http
# $IPT -A DOCKER-USER -p TCP -m conntrack --ctorigdstport 8080 -j ACCEPT

# Drop everything else
$IPT -A DOCKER-USER -j DROP

# Reset Default Policies
$IPT -P INPUT ACCEPT
$IPT -P FORWARD ACCEPT
$IPT -P OUTPUT ACCEPT

$IPT -t nat -P PREROUTING ACCEPT
$IPT -t nat -P INPUT ACCEPT
$IPT -t nat -P OUTPUT ACCEPT
$IPT -t nat -P POSTROUTING ACCEPT

$IPT -t mangle -P PREROUTING ACCEPT
$IPT -t mangle -P INPUT ACCEPT
$IPT -t mangle -P FORWARD ACCEPT
$IPT -t mangle -P OUTPUT ACCEPT
$IPT -t mangle -P POSTROUTING ACCEPT

$IPT -t filter -P INPUT ACCEPT
$IPT -t filter -P FORWARD ACCEPT
$IPT -t filter -P OUTPUT ACCEPT

$IPT -t raw -P PREROUTING ACCEPT
$IPT -t raw -P OUTPUT ACCEPT

$IPT -t security -P INPUT ACCEPT
$IPT -t security -P FORWARD ACCEPT
$IPT -t security -P OUTPUT ACCEPT

# Flush all rules
$IPT -F
$IPT -t nat -F
$IPT -t mangle -F
$IPT -t filter -F
$IPT -t raw -F
$IPT -t security -F

# Erase all non-default chains
$IPT -X
$IPT -t nat -X
$IPT -t mangle -X
$IPT -t filter -X
$IPT -t raw -X
$IPT -t security -X

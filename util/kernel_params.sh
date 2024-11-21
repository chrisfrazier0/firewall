# Required to enable IPv4 forwarding.
if [ "$GATEWAY" = "true" ]; then
    if [ "$SYSCTL" = "" ]; then
        echo "1" > /proc/sys/net/ipv4/ip_forward
    else
        $SYSCTL net.ipv4.ip_forward="1"
    fi
else
    if [ "$SYSCTL" = "" ]; then
        echo "0" > /proc/sys/net/ipv4/ip_forward
    else
        $SYSCTL net.ipv4.ip_forward="0"
    fi
fi

# This enables SYN flood protection.
if [ "$SYSCTL" = "" ]; then
    echo "1" > /proc/sys/net/ipv4/tcp_syncookies
else
    $SYSCTL net.ipv4.tcp_syncookies="1"
fi

# This enables source validation by reversed path according to RFC1812.
# In other words, did the response packet originate from the same interface
# through which the source packet was sent?
if [ "$SYSCTL" = "" ]; then
    echo "1" > /proc/sys/net/ipv4/conf/all/rp_filter
else
    $SYSCTL net.ipv4.conf.all.rp_filter="1"
fi

# This kernel parameter instructs the kernel to ignore all ICMP
# echo requests sent to the broadcast address.
if [ "$SYSCTL" = "" ]; then
    echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
else
    $SYSCTL net.ipv4.icmp_echo_ignore_broadcasts="1"
fi

# This option can be used to accept or refuse source routed
# packets. It is usually on by default, but is generally
# considered a security risk. This option turns it off.
if [ "$SYSCTL" = "" ]; then
    echo "0" > /proc/sys/net/ipv4/conf/all/accept_source_route
else
    $SYSCTL net.ipv4.conf.all.accept_source_route="0"
fi

# This option can disable ICMP redirects. ICMP redirects
# are generally considered a security risk and shouldn't be
# needed by most systems using this generator.
if [ "$SYSCTL" = "" ]; then
   echo "0" > /proc/sys/net/ipv4/conf/all/accept_redirects
else
   $SYSCTL net.ipv4.conf.all.accept_redirects="0"
fi

# However, we'll ensure the secure_redirects option is on instead.
# This option accepts only from gateways in the default gateways list.
if [ "$SYSCTL" = "" ]; then
    echo "1" > /proc/sys/net/ipv4/conf/all/secure_redirects
else
    $SYSCTL net.ipv4.conf.all.secure_redirects="1"
fi

# This option logs packets from impossible addresses.
if [ "$LOG_DROPS" = "true" ]; then
    if [ "$SYSCTL" = "" ]; then
        echo "1" > /proc/sys/net/ipv4/conf/all/log_martians
    else
        $SYSCTL net.ipv4.conf.all.log_martians="1"
    fi
else
    if [ "$SYSCTL" = "" ]; then
        echo "0" > /proc/sys/net/ipv4/conf/all/log_martians
    else
        $SYSCTL net.ipv4.conf.all.log_martians="0"
    fi
fi

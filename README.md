# iptables firewall script

### Installation

```
apt install iptables-persistent
git clone https://github.com/chrisfrazier0/firewall /opt/firewall
rm -rf /opt/firewall/.git/
chmod 700 /opt/firewall
/opt/firewall/iptables start
/opt/firewall/iptables save
```

### Configuration

Edit `/opt/firewall/iptables.conf` and review all of the default chains/rules.

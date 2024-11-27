# iptables firewall script

### Installation

```
apt install iptables-persistent
git clone https://github.com/chrisfrazier0/firewall /opt/firewall
rm -rf /opt/firewall/.git/
chmod 700 /opt/firewall

vi /opt/firewall/iptables.conf

/opt/firewall/util/disable_ipv6
/opt/firewall/iptables start
/opt/firewall/iptables save
```

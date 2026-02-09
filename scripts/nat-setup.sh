sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -o ens5 -j MASQUERADE 2>/dev/null || sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
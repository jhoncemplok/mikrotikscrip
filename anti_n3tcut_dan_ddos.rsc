/ip firewall filter

add action=add-src-to-address-list address-list=DDOS address-list-timeout=15s chain=input comment="" disabled=no dst-port=1337 protocol=tcp
add action=add-src-to-address-list address-list=DDOS-address-list-timeout=15m chain=input comment="" disabled=no dst-port=7331 protocol=tcp src-address-list=knock
add action=add-src-to-address-list address-list="port-scanners" address-list-timeout=2w chain=input comment="port-scanners-to-list " disabled=no protocol=tcp psd=21,3s,3,1
add action=add-src-to-address-list address-list="port-scanners" address-list-timeout=2w chain=input comment="SYN/FIN scan" disabled=no protocol=tcp tcp-flags=fin,syn
add action=add-src-to-address-list address-list="port-scanners" address-list-timeout=2w chain=input comment="SYN/RST scan" disabled=no protocol=tcp tcp-flags=syn,rst
add action=add-src-to-address-list address-list="port-scanners" address-list-timeout=2w chain=input disabled=no tcp-flags=fin,psh,urg,!syn,!rst,!ack protocol=tcp comment="FIN/PSH/URG-Scan"
add action=add-src-to-address-list address-list="port-scanners" address-list-timeout=2w chain=input disabled=no protocol=tcp tcp-flags=fin,syn,rst,psh,ack,urg comment="ALL/ALL-Scan"
add action=add-src-to-address-list address-list="port-scanners" address-list-timeout=2w chain=input tcp-flags=!fin,!syn,!rst,!psh,!ack,!urg comment="NMAP-NULL-Scan" disabled=no protocol=tcp
add action=add-src-to-address-list address-list="port-scanners" address-list-timeout=2w chain=input comment="NMAP-FIN-Stealth-Scan" disabled=no protocol=tcp
add action=accept chain=input comment="ANTI-NETCUT" disabled=no dst-port=0-65535 protocol=tcp src-address=192.168.0.1/27 




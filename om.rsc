# jan/22/2019 19:00:40 by RouterOS 6.38.5
# software id = CZAG-V34U
#
/interface wireless
set [ find default-name=wlan1 ] band=2ghz-b/g/n disabled=no frequency=auto \
    mode=ap-bridge ssid="Ngopi'o Sik! #HOTSPOT" tx-power=12 tx-power-mode=\
    all-rates-fixed wps-mode=disabled
add keepalive-frames=disabled mac-address=D6:CA:6D:55:F4:A9 master-interface=\
    wlan1 mode=ap-bridge multicast-buffering=disabled name=wlan2 ssid=\
    "Ngopi'o Sik! #Browsing" wds-cost-range=0 wds-default-cost=0 wps-mode=\
    disabled

/ip hotspot profile
set [ find default=yes ] html-directory=ngopio
add dns-name=ngopio.sik hotspot-address=192.172.10.1 html-directory=ngopio \
    http-cookie-lifetime=1d name=hsprof1
/ip hotspot user profile
set [ find default=yes ] shared-users=4
add !idle-timeout !keepalive-timeout name="Teh " rate-limit=386k/1424k \
    shared-users=20 transparent-proxy=yes
add !idle-timeout !keepalive-timeout mac-cookie-timeout=2m name=ratuku \
    rate-limit=112k/196k shared-users=5 transparent-proxy=yes

/ip pool
add name=hs-pool-6 ranges=192.172.10.5-192.172.10.62
/ip dhcp-server
add address-pool=hs-pool-6 disabled=no interface=wlan1 name=dhcp1
/ip hotspot
add address-pool=hs-pool-6 disabled=no interface=wlan1 name=hotspot1 profile=\
    hsprof1

/ip hotspot user profile
add address-pool=hs-pool-6 mac-cookie-timeout=10m name=umum shared-users=20 \
    transparent-proxy=yes

/queue simple
add disabled=yes limit-at=64k/64k max-limit=128k/256k name=ratuku1 queue=\
    default/default target=192.172.10.14/32 total-queue=default
add max-limit=512k/1M name=ratuku2 queue=default/default target=\
    192.172.10.11/32 total-queue=default
add max-limit=512k/1M name=Pus queue=default/default target=192.172.10.9/32 \
    total-queue=default

/queue tree
add max-limit=1G name=DOWNLOAD parent=global queue=default
add bucket-size=0 limit-at=64k max-limit=1G name=1.VIP packet-mark=vip-down \
    parent=DOWNLOAD priority=1 queue=default
add bucket-size=0 limit-at=500k max-limit=10M name=2.GAMES packet-mark=\
    games-down parent=DOWNLOAD priority=3 queue=default
add limit-at=8M max-limit=8M name=3.NORMAL parent=DOWNLOAD queue=default
add limit-at=1M max-limit=8M name=3.2.BROWSING packet-mark=browsing-down \
    parent=3.NORMAL priority=5 queue=pcq-download-default
add limit-at=1M max-limit=8M name=3.3.MIDDLE packet-mark=midle-down parent=\
    3.NORMAL priority=7 queue=pcq-download-default
add limit-at=1M max-limit=8M name=3.4.HIGH packet-mark=high-down parent=\
    3.NORMAL queue=pcq-download-default
add limit-at=1M max-limit=8M name=3.5.UNKNOWN packet-mark=unknown-down \
    parent=3.NORMAL queue=pcq-download-default
add limit-at=1M max-limit=2M name=4.GOOGLE packet-mark=ggc-telkom-down \
    parent=DOWNLOAD queue=default
add max-limit=1G name=UPLOAD parent=global queue=default
add limit-at=64k max-limit=100M name=1.U-VIP packet-mark=vip-up parent=UPLOAD \
    priority=1 queue=default
add limit-at=500k max-limit=10M name=2.U-GAMES packet-mark=games-up parent=\
    UPLOAD priority=3 queue=default
add limit-at=1500k max-limit=2M name=3.U-NORMAL parent=UPLOAD queue=default
add limit-at=200k max-limit=2M name=3.2.U-BROWSING packet-mark=browsing-up \
    parent=3.U-NORMAL priority=5 queue=pcq-upload-default
add limit-at=200k max-limit=2M name=3.3.U-MIDDLE packet-mark=midle-up parent=\
    3.U-NORMAL priority=7 queue=pcq-upload-default
add limit-at=200k max-limit=2M name=3.4.U-HIGH packet-mark=high-up parent=\
    3.U-NORMAL queue=pcq-upload-default
add limit-at=200k max-limit=2M name=3.5.U-UNKNOWN packet-mark=unknown-up \
    parent=3.U-NORMAL queue=pcq-upload-default
add limit-at=200k max-limit=2M name=4.U-GOOGLE packet-mark=ggc-telkom-up \
    parent=UPLOAD queue=pcq-upload-default
add limit-at=1M max-limit=10M name=3.1.SOSMED packet-mark=sosmed-down parent=\
    3.NORMAL priority=5 queue=pcq-download-default
add limit-at=200k max-limit=2M name=3.1.U-SOSMED packet-mark=sosmed-up \
    parent=3.U-NORMAL priority=5 queue=pcq-upload-default

/ip address
add address=192.172.10.1/26 interface=wlan1 network=192.172.10.0
add address=192.10.172.1/26 disabled=yes interface=wlan2 network=192.10.172.0
add address=192.172.11.1/26 interface=wlan1 network=192.172.11.0

/ip cloud
set ddns-enabled=yes update-time=no
/ip dhcp-client
add default-route-distance=0 dhcp-options=hostname,clientid disabled=no \
    interface=ether1
/ip dhcp-server network
add address=192.172.10.0/26 comment="hotspot network" gateway=192.172.10.1
/ip dns
set allow-remote-requests=yes servers=192.168.1.1


/ip firewall address-list
add address=0.0.0.0/8 list=private-lokal
add address=10.0.0.0/8 list=private-lokal
add address=100.64.0.0/10 list=private-lokal
add address=127.0.0.0/8 list=private-lokal
add address=169.254.0.0/16 list=private-lokal
add address=172.16.0.0/12 list=private-lokal
add address=192.0.0.0/24 list=private-lokal
add address=192.0.2.0/24 list=private-lokal
add address=192.168.0.0/16 list=private-lokal
add address=198.18.0.0/15 list=private-lokal
add address=198.51.100.0/24 list=private-lokal
add address=203.0.113.0/24 list=private-lokal
add address=224.0.0.0/3 list=private-lokal
add address=118.98.0.0/17 list=ggc-telkom
add address=118.97.0.0/16 list=ggc-telkom
add address=216.239.32.0/19 list=ggc-telkom
add address=216.58.192.0/19 list=ggc-telkom
add address=172.217.0.0/16 list=ggc-telkom
add address=74.125.0.0/16 list=ggc-telkom
add address=192.172.10.0/26 list=private-lokal
add address=192.10.172.0/26 list=private-lokal

/ip firewall address-list
add list=games_iix address="1.2.3.4"
remove [find list="games_iix"]
add list=games_iix address="64.211.145.89"
add list=games_iix address="64.211.145.91"
add list=games_iix address="64.211.145.104"
add list=games_iix address="64.233.181.97"
add list=games_iix address="64.233.189.113"
add list=games_iix address="65.54.82.164"
add list=games_iix address="65.55.162.26"
add list=games_iix address="66.220.146.25"
add list=games_iix address="69.63.181.11"
add list=games_iix address="69.63.181.16"
add list=games_iix address="69.63.186.30"
add list=games_iix address="74.125.153.138"
add list=games_iix address="75.125.122.98"
add list=games_iix address="116.12.45.2"
add list=games_iix address="119.110.77.1"
add list=games_iix address="119.110.77.2"
add list=games_iix address="119.110.77.3"
add list=games_iix address="119.110.77.4"
add list=games_iix address="119.110.77.5"
add list=games_iix address="119.110.77.6"
add list=games_iix address="119.110.77.7"
add list=games_iix address="119.160.200.173"
add list=games_iix address="119.160.200.166"
add list=games_iix address="119.160.200.168"
add list=games_iix address="122.102.49.0/24"
add list=games_iix address="122.102.48.0/24"
add list=games_iix address="122.102.50.0/24"
add list=games_iix address="122.102.51.0/24"
add list=games_iix address="122.102.52.0/24"
add list=games_iix address="122.102.53.0/24"
add list=games_iix address="122.102.54.0/24"
add list=games_iix address="122.102.55.0/24"
add list=games_iix address="122.144.2.38"
add list=games_iix address="122.144.2.132"
add list=games_iix address="122.144.2.137"
add list=games_iix address="125.160.17.181"
add list=games_iix address="125.160.17.182"
add list=games_iix address="124.195.18.122"
add list=games_iix address="125.56.199.10"
add list=games_iix address="125.56.199.16"
add list=games_iix address="125.56.199.27"
add list=games_iix address="125.160.173.26"
add list=games_iix address="125.163.212.218"
add list=games_iix address="173.194.0.148"
add list=games_iix address="202.43.161.117"
add list=games_iix address="202.43.161.120"
add list=games_iix address="202.43.161.121"
add list=games_iix address="202.43.167.70"
add list=games_iix address="202.43.171.131"
add list=games_iix address="202.43.171.130"
add list=games_iix address="202.43.171.133"
add list=games_iix address="202.43.171.134"
add list=games_iix address="202.57.118.35"
add list=games_iix address="202.57.118.54"
add list=games_iix address="202.58.163.204"
add list=games_iix address="202.67.15.34"
add list=games_iix address="202.70.134.34"
add list=games_iix address="202.70.134.35"
add list=games_iix address="202.70.134.37"
add list=games_iix address="202.74.73.98"
add list=games_iix address="202.78.197.83"
add list=games_iix address="202.78.197.85"
add list=games_iix address="202.89.208.61"
add list=games_iix address="202.93.17.0/24"
add list=games_iix address="202.93.18.0/24"
add list=games_iix address="202.93.19.0/24"
add list=games_iix address="202.93.20.0/24"
add list=games_iix address="202.93.21.0/24"
add list=games_iix address="202.93.22.0/24"
add list=games_iix address="202.93.23.0/24"
add list=games_iix address="202.93.24.0/24"
add list=games_iix address="202.93.25.0/24"
add list=games_iix address="202.93.26.0/24"
add list=games_iix address="202.93.27.0/24"
add list=games_iix address="202.93.28.0/24"
add list=games_iix address="202.93.29.0/24"
add list=games_iix address="202.93.30.0/24"
add list=games_iix address="202.93.31.0/24"
add list=games_iix address="202.162.207.111"
add list=games_iix address="202.138.226.22"
add list=games_iix address="202.138.226.19"
add list=games_iix address="202.149.65.139"
add list=games_iix address="202.149.65.142"
add list=games_iix address="202.149.65.160"
add list=games_iix address="202.93.16.0/24"
add list=games_iix address="203.77.212.20"
add list=games_iix address="203.89.146.0/24"
add list=games_iix address="203.89.147.12"
add list=games_iix address="203.89.147.13"
add list=games_iix address="204.2.171.27"
add list=games_iix address="204.2.171.154"
add list=games_iix address="204.2.171.97"
add list=games_iix address="204.2.171.112"
add list=games_iix address="204.117.211.2"
add list=games_iix address="204.117.211.3"
add list=games_iix address="204.117.211.4"
add list=games_iix address="209.190.9.202"
add list=games_iix address="209.51.218.170"
add list=games_iix address="211.43.208.219"
add list=games_iix address="211.233.43.45"
add list=games_iix address="212.58.226.79"


/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=drop chain=input comment=dns-flood dst-port=53,5353 protocol=tcp \
    src-address-list=!private-lokal
add action=drop chain=input comment=dns-flood dst-port=53,5353 protocol=udp \
    src-address-list=!private-lokal
add action=drop chain=forward comment=dns-flood dst-port=53,5353 protocol=tcp \
    src-address-list=!private-lokal
add action=drop chain=forward comment=dns-flood dst-port=53,5353 protocol=udp \
    src-address-list=!private-lokal
add action=accept chain=input comment="defconf: accept ICMP" protocol=icmp
add action=accept chain=input comment="defconf: accept ICMP" dst-port=\
    8291-8299,8030-8039,2222,22,5900-5911,1701-1723,8123,1194,8012,8123 \
    protocol=tcp
add action=accept chain=input comment="defconf: accept ICMP" dst-port=\
    8291-8299,8030-8039,2222,22,5900-5911,1701-1723,8123,1194,8012,8123 \
    protocol=udp
add action=accept chain=input comment="defconf: accept established,related" \
    connection-state=established,related
add action=drop chain=input comment="defconf: drop all from WAN" \
    in-interface=ether1
add action=accept chain=forward comment="defconf: accept established,related" \
    connection-state=established,related
add action=drop chain=forward comment="defconf: drop invalid" \
    connection-state=invalid
add action=drop chain=forward comment=\
    "defconf: drop all from WAN not DSTNATed" connection-nat-state=!dstnat \
    connection-state=new in-interface=ether1


/ip firewall mangle
add action=mark-connection chain=prerouting comment=private-lokal \
    dst-address-list=private-lokal new-connection-mark=private-lokal \
    passthrough=yes src-address-list=private-lokal
add action=accept chain=prerouting comment=private-lokal connection-mark=\
    private-lokal dst-address-list=private-lokal src-address-list=\
    private-lokal
add action=mark-connection chain=prerouting comment=vip dst-address-list=\
    !private-lokal new-connection-mark=vip passthrough=yes protocol=icmp \
    src-address-list=private-lokal
add action=mark-connection chain=prerouting comment=dns dst-address-list=\
    !private-lokal dst-port=53,5353,123,1194 new-connection-mark=vip \
    passthrough=yes protocol=tcp src-address-list=private-lokal
add action=mark-connection chain=prerouting comment=dns dst-address-list=\
    !private-lokal dst-port=53,5353,123,1194 new-connection-mark=vip \
    passthrough=yes protocol=udp src-address-list=private-lokal
add action=accept chain=prerouting comment=vip connection-mark=vip
add action=mark-connection chain=prerouting comment=games dst-address-list=\
    games new-connection-mark=games passthrough=yes src-address-list=\
    private-lokal
add action=accept chain=prerouting comment=games connection-mark=games
add action=mark-connection chain=prerouting comment=sosmed dst-address-list=\
    sosmed new-connection-mark=sosmed passthrough=yes src-address-list=\
    private-lokal
add action=accept chain=prerouting comment=sosmed connection-mark=sosmed
add action=mark-connection chain=prerouting comment=ggc-telkom \
    dst-address-list=ggc-telkom new-connection-mark=ggc-redirector \
    passthrough=yes src-address-list=private-lokal
add action=accept chain=prerouting comment=ggc-redirector connection-mark=\
    ggc-redirector
add action=mark-connection chain=prerouting comment=all-trafik \
    dst-address-list=!private-lokal new-connection-mark=all-trafik \
    passthrough=yes src-address-list=private-lokal
add action=accept chain=prerouting comment=all-trafik connection-mark=\
    all-trafik
add action=jump chain=forward in-interface=ether1 jump-target=qos-down
add action=mark-packet chain=qos-down comment=vip-down connection-mark=vip \
    new-packet-mark=vip-down passthrough=no
add action=mark-packet chain=qos-down comment=games-down connection-mark=\
    games new-packet-mark=games-down passthrough=no
add action=mark-packet chain=qos-down comment=sosmed-down connection-mark=\
    sosmed new-packet-mark=sosmed-down passthrough=no
add action=mark-packet chain=qos-down comment=ggc-telkom-down \
    connection-mark=ggc-redirector new-packet-mark=ggc-telkom-down \
    passthrough=no
add action=mark-packet chain=qos-down comment=browsing-down connection-bytes=\
    0-1000000 connection-mark=all-trafik new-packet-mark=browsing-down \
    passthrough=no
add action=mark-packet chain=qos-down comment=midle-down connection-bytes=\
    1000001-3000000 connection-mark=all-trafik new-packet-mark=midle-down \
    passthrough=no
add action=mark-packet chain=qos-down comment=high-down connection-bytes=\
    3000001-1000000000 connection-mark=all-trafik new-packet-mark=high-down \
    passthrough=no
add action=mark-packet chain=qos-down comment=unknown-down connection-mark=\
    all-trafik new-packet-mark=unknown-down passthrough=no
add action=mark-packet chain=qos-down comment=unknown-down new-packet-mark=\
    unknown-down passthrough=no
add action=return chain=qos-down
add action=jump chain=forward jump-target=qos-up out-interface=ether1
add action=mark-packet chain=qos-up comment=vip-up connection-mark=vip \
    new-packet-mark=vip-up passthrough=no
add action=mark-packet chain=qos-up comment=games-up connection-mark=games \
    new-packet-mark=games-up passthrough=no
add action=mark-packet chain=qos-up comment=sosmed-up connection-mark=sosmed \
    new-packet-mark=sosmed-up passthrough=no
add action=mark-packet chain=qos-up comment=ggc-telkom-up connection-mark=\
    ggc-redirector new-packet-mark=ggc-telkom-up passthrough=no
add action=mark-packet chain=qos-up comment=browsing-up connection-bytes=\
    0-500000 connection-mark=all-trafik new-packet-mark=browsing-up \
    passthrough=no
add action=mark-packet chain=qos-up comment=midle-up connection-bytes=\
    501000-1500000 connection-mark=all-trafik new-packet-mark=midle-up \
    passthrough=no
add action=mark-packet chain=qos-up comment=high-up connection-bytes=\
    1500001-1000000000 connection-mark=all-trafik new-packet-mark=high-up \
    passthrough=no
add action=mark-packet chain=qos-up comment=unknown-up connection-mark=\
    all-trafik new-packet-mark=unknown-up passthrough=no
add action=mark-packet chain=qos-up comment=unknown-up new-packet-mark=\
    unknown-up passthrough=no
add action=return chain=qos-up


/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat out-interface=ether1
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=192.172.10.0/26


/ip firewall raw
add action=add-dst-to-address-list address-list=games chain=prerouting \
    comment=Vainglory dst-address-list=!private-lokal dst-port=7000-8020 \
    protocol=tcp src-address-list=private-lokal
add action=add-dst-to-address-list address-list=games chain=prerouting \
    comment=Vainglory content=.superevil.net dst-address-list=!private-lokal \
    src-address-list=private-lokal
add action=add-dst-to-address-list address-list=games chain=prerouting \
    comment="Mobile Legends" dst-address-list=!private-lokal dst-port=\
    30000-30150 protocol=tcp src-address-list=private-lokal
add action=add-dst-to-address-list address-list=games chain=prerouting \
    comment="Mobile Legends" dst-address-list=!private-lokal dst-port=\
    5000-5600 protocol=udp src-address-list=private-lokal
add action=add-dst-to-address-list address-list=games chain=prerouting \
    comment="Mobile Legends" content=.youngjoygame.com dst-address-list=\
    !private-lokal src-address-list=private-lokal
add action=add-dst-to-address-list address-list=games chain=prerouting \
    comment="PUBG Mobile" dst-address-list=!private-lokal dst-port=\
    10012,17500 protocol=tcp src-address-list=private-lokal
add action=add-dst-to-address-list address-list=games chain=prerouting \
    comment="PUBG Mobile" dst-address-list=!private-lokal dst-port="10491,1001\
    0,10013,10612,20002,20001,20000,12235,13748,13972,13894,11455,10096,10039" \
    protocol=udp src-address-list=private-lokal
add action=add-dst-to-address-list address-list=games chain=prerouting \
    comment="PUBG Mobile" content=.igamecj.com dst-address-list=\
    !private-lokal src-address-list=private-lokal
add action=add-dst-to-address-list address-list=games chain=prerouting \
    comment="PUBG Mobile" content=tencentgames.helpshift.com \
    dst-address-list=!private-lokal src-address-list=private-lokal
add action=add-dst-to-address-list address-list=games chain=prerouting \
    comment=Garena content=.garenanow.com dst-address-list=!private-lokal \
    src-address-list=private-lokal
add action=add-dst-to-address-list address-list=sosmed chain=prerouting \
    comment=ig content=.cdninstagram.com dst-address-list=!private-lokal \
    src-address-list=private-lokal
add action=add-dst-to-address-list address-list=sosmed chain=prerouting \
    comment=ig content=.instagram.com dst-address-list=!private-lokal \
    src-address-list=private-lokal
add action=add-dst-to-address-list address-list=sosmed chain=prerouting \
    comment=WA content=.whatsapp.net dst-address-list=!private-lokal \
    src-address-list=private-lokal
add action=add-dst-to-address-list address-list=sosmed chain=prerouting \
    comment=WA content=.whatsapp.com dst-address-list=!private-lokal \
    src-address-list=private-lokal
add action=add-dst-to-address-list address-list=sosmed chain=prerouting \
    comment=life360 content=.life360.com dst-address-list=!private-lokal \
    src-address-list=private-lokal
add action=add-dst-to-address-list address-list=sosmed chain=prerouting \
    comment=fb content=.facebook.com dst-address-list=!private-lokal \
    src-address-list=private-lokal
add action=add-dst-to-address-list address-list=sosmed address-list-timeout=\
    0s chain=prerouting comment=fb content=.facebook.net dst-address-list=\
    !private-lokal src-address-list=private-lokal
add action=add-dst-to-address-list address-list=sosmed chain=prerouting \
    comment=fb content=.fbcdn.net dst-address-list=!private-lokal \
    src-address-list=private-lokal
add action=add-dst-to-address-list address-list=sosmed chain=prerouting \
    comment=twitter content=.twitter.com dst-address-list=!private-lokal \
    src-address-list=private-lokal
add action=add-dst-to-address-list address-list=sosmed chain=prerouting \
    comment=twitter content=.twimg.com dst-address-list=!private-lokal \
    src-address-list=private-lokal
add action=add-dst-to-address-list address-list=sosmed chain=prerouting \
    comment=tiktok content=.tiktokv.com dst-address-list=!private-lokal \
    src-address-list=private-lokal

/ip hotspot ip-binding
add mac-address=00:08:22:D9:F7:17 server=hotspot1 type=bypassed

/ip hotspot user
add name=admin password=yatmiant00
add disabled=yes limit-uptime=23h name=ka password=mi5 profile="Teh " server=\
    hotspot1
add disabled=yes limit-uptime=23h name=ipok password=sek profile="Teh " \
    server=hotspot1
add name=ujik password=ujik098
add name=nur password=abiputra
add disabled=yes limit-uptime=15h name=ipok password=sanab profile=umum \
    server=hotspot1
add disabled=yes limit-uptime=23h59m59s name=mie password=nggu profile="Teh " \
    server=hotspot1
add disabled=yes limit-uptime=23h name=mon password=dey profile="Teh " \
    server=hotspot1
add disabled=yes limit-uptime=23h name=rab password=bow profile=umum server=\
    hotspot1
add limit-uptime=23h name=free password=dei profile="Teh " server=hotspot1
add disabled=yes name=beb password=a5 profile=umum server=hotspot1
add disabled=yes limit-uptime=23h name=sun password=dai profile="Teh " \
    server=hotspot1
add disabled=yes name=bek password=ing profile=umum server=hotspot1
add disabled=yes limit-uptime=14h name=sen password=!n profile="Teh " server=\
    hotspot1
add name=re password=mote
add limit-bytes-total=300000000 name=free password=pass profile=ratuku

/ip service
set www port=8081
/system clock
set time-zone-name=Asia/Jakarta
/system routerboard settings
set silent-boot=yes
/tool graphing interface
add interface=wlan1 store-on-disk=no
add interface=ether1

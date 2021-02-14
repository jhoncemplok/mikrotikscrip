/interface vlan
add interface="09." name="3021. Hotspot VLAN" vlan-id=3021
add interface="09." name="3022. Hotspot VLAN" vlan-id=3022
add interface="09." name="3023. Hotspot VLAN" vlan-id=3023
add interface="09." name="3024. Hotspot VLAN" vlan-id=3024
add interface="09." name="3025. Hotspot VLAN" vlan-id=3025
add interface="09." name="3026. Hotspot VLAN" vlan-id=3026
add interface="09." name="3027. Hotspot VLAN" vlan-id=3027
add interface="09." name="3028. Hotspot VLAN" vlan-id=3028
add interface="09." name="3029. Hotspot VLAN" vlan-id=3029
add interface="09." name="3030. Hotspot VLAN" vlan-id=3030

/ip address
add address=172.30.21.1/24 interface="3021."
add address=172.30.22.1/24 interface="3022."
add address=172.30.23.1/24 interface="3023."
add address=172.30.24.1/24 interface="3024."
add address=172.30.25.1/24 interface="3025."
add address=172.30.26.1/24 interface="3026."
add address=172.30.27.1/24 interface="3027."
add address=172.30.28.1/24 interface="3028."
add address=172.30.29.1/24 interface="3029."
add address=172.30.30.1/24 interface="3030."

/ip hotspot profile
add hotspot-address=172.30.21.1 html-directory=flash/hotspot login-by=http-chap,http-pap name=hsprof-vlan-3021 nas-port-type=ethernet radius-interim-update=30s use-radius=yes
add hotspot-address=172.30.22.1 html-directory=flash/hotspot login-by=http-chap,http-pap name=hsprof-vlan-3022 nas-port-type=ethernet radius-interim-update=30s use-radius=yes
add hotspot-address=172.30.23.1 html-directory=flash/hotspot login-by=http-chap,http-pap name=hsprof-vlan-3023 nas-port-type=ethernet radius-interim-update=30s use-radius=yes
add hotspot-address=172.30.24.1 html-directory=flash/hotspot login-by=http-chap,http-pap name=hsprof-vlan-3024 nas-port-type=ethernet radius-interim-update=30s use-radius=yes
add hotspot-address=172.30.25.1 html-directory=flash/hotspot login-by=http-chap,http-pap name=hsprof-vlan-3025 nas-port-type=ethernet radius-interim-update=30s use-radius=yes
add hotspot-address=172.30.26.1 html-directory=flash/hotspot login-by=http-chap,http-pap name=hsprof-vlan-3026 nas-port-type=ethernet radius-interim-update=30s use-radius=yes
add hotspot-address=172.30.27.1 html-directory=flash/hotspot login-by=http-chap,http-pap name=hsprof-vlan-3027 nas-port-type=ethernet radius-interim-update=30s use-radius=yes
add hotspot-address=172.30.28.1 html-directory=flash/hotspot login-by=http-chap,http-pap name=hsprof-vlan-3028 nas-port-type=ethernet radius-interim-update=30s use-radius=yes
add hotspot-address=172.30.29.1 html-directory=flash/hotspot login-by=http-chap,http-pap name=hsprof-vlan-3029 nas-port-type=ethernet radius-interim-update=30s use-radius=yes
add hotspot-address=172.30.30.1 html-directory=flash/hotspot login-by=http-chap,http-pap name=hsprof-vlan-3030 nas-port-type=ethernet radius-interim-update=30s use-radius=yes

/ip pool
add name=hs-pool-vlan-3021 ranges=172.30.21.11-172.30.21.254
add name=hs-pool-vlan-3022 ranges=172.30.22.11-172.30.22.254
add name=hs-pool-vlan-3023 ranges=172.30.23.11-172.30.23.254
add name=hs-pool-vlan-3024 ranges=172.30.24.11-172.30.24.254
add name=hs-pool-vlan-3025 ranges=172.30.25.11-172.30.25.254
add name=hs-pool-vlan-3026 ranges=172.30.26.11-172.30.26.254
add name=hs-pool-vlan-3027 ranges=172.30.27.11-172.30.27.254
add name=hs-pool-vlan-3028 ranges=172.30.28.11-172.30.28.254
add name=hs-pool-vlan-3029 ranges=172.30.29.11-172.30.29.254
add name=hs-pool-vlan-3030 ranges=172.30.30.11-172.30.30.254
add name=PPPoE-vlan-3021 ranges=172.130.21.11-172.130.21.254
add name=PPPoE-vlan-3022 ranges=172.130.22.11-172.130.22.254
add name=PPPoE-vlan-3023 ranges=172.130.23.11-172.130.23.254
add name=PPPoE-vlan-3024 ranges=172.130.24.11-172.130.24.254
add name=PPPoE-vlan-3025 ranges=172.130.25.11-172.130.25.254
add name=PPPoE-vlan-3026 ranges=172.130.26.11-172.130.26.254
add name=PPPoE-vlan-3027 ranges=172.130.27.11-172.130.27.254
add name=PPPoE-vlan-3028 ranges=172.130.28.11-172.130.28.254
add name=PPPoE-vlan-3029 ranges=172.130.29.11-172.130.29.254
add name=PPPoE-vlan-3030 ranges=172.130.30.11-172.130.30.254

/ip dhcp-server
add address-pool=hs-pool-vlan-3021 disabled=no interface="3021. " lease-time=1h name=dhcp-vlan3021
add address-pool=hs-pool-vlan-3022 disabled=no interface="3022. " lease-time=1h name=dhcp-vlan3022
add address-pool=hs-pool-vlan-3023 disabled=no interface="3023. " lease-time=1h name=dhcp-vlan3023
add address-pool=hs-pool-vlan-3024 disabled=no interface="3024. " lease-time=1h name=dhcp-vlan3024
add address-pool=hs-pool-vlan-3025 disabled=no interface="3025. " lease-time=1h name=dhcp-vlan3025
add address-pool=hs-pool-vlan-3026 disabled=no interface="3026. " lease-time=1h name=dhcp-vlan3026
add address-pool=hs-pool-vlan-3027 disabled=no interface="3027. " lease-time=1h name=dhcp-vlan3027
add address-pool=hs-pool-vlan-3028 disabled=no interface="3028. " lease-time=1h name=dhcp-vlan3028
add address-pool=hs-pool-vlan-3029 disabled=no interface="3029. " lease-time=1h name=dhcp-vlan3029
add address-pool=hs-pool-vlan-3030 disabled=no interface="3030. " lease-time=1h name=dhcp-vlan3030

/ip dhcp-server network
add address=172.30.21.0/24 gateway=172.30.21.1 netmask=32
add address=172.30.22.0/24 gateway=172.30.22.1 netmask=32
add address=172.30.23.0/24 gateway=172.30.23.1 netmask=32
add address=172.30.24.0/24 gateway=172.30.24.1 netmask=32
add address=172.30.25.0/24 gateway=172.30.25.1 netmask=32
add address=172.30.26.0/24 gateway=172.30.26.1 netmask=32
add address=172.30.27.0/24 gateway=172.30.27.1 netmask=32
add address=172.30.28.0/24 gateway=172.30.28.1 netmask=32
add address=172.30.29.0/24 gateway=172.30.29.1 netmask=32
add address=172.30.30.0/24 gateway=172.30.30.1 netmask=32

/ip hotspot
add address-pool=hs-pool-vlan-3021 addresses-per-mac=unlimited disabled=no interface="3021. " keepalive-timeout=1h login-timeout=1m name="Hotspot vlan3021" profile=hsprof-vlan-3021
add address-pool=hs-pool-vlan-3022 addresses-per-mac=unlimited disabled=no interface="3022. " keepalive-timeout=1h login-timeout=1m name="Hotspot vlan3022" profile=hsprof-vlan-3022
add address-pool=hs-pool-vlan-3023 addresses-per-mac=unlimited disabled=no interface="3023. " keepalive-timeout=1h login-timeout=1m name="Hotspot vlan3023" profile=hsprof-vlan-3023
add address-pool=hs-pool-vlan-3024 addresses-per-mac=unlimited disabled=no interface="3024. " keepalive-timeout=1h login-timeout=1m name="Hotspot vlan3024" profile=hsprof-vlan-3024
add address-pool=hs-pool-vlan-3025 addresses-per-mac=unlimited disabled=no interface="3025. " keepalive-timeout=1h login-timeout=1m name="Hotspot vlan3025" profile=hsprof-vlan-3025
add address-pool=hs-pool-vlan-3026 addresses-per-mac=unlimited disabled=no interface="3026. " keepalive-timeout=1h login-timeout=1m name="Hotspot vlan3026" profile=hsprof-vlan-3026
add address-pool=hs-pool-vlan-3027 addresses-per-mac=unlimited disabled=no interface="3027. " keepalive-timeout=1h login-timeout=1m name="Hotspot vlan3027" profile=hsprof-vlan-3027
add address-pool=hs-pool-vlan-3028 addresses-per-mac=unlimited disabled=no interface="3028. " keepalive-timeout=1h login-timeout=1m name="Hotspot vlan3028" profile=hsprof-vlan-3028
add address-pool=hs-pool-vlan-3029 addresses-per-mac=unlimited disabled=no interface="3029. " keepalive-timeout=1h login-timeout=1m name="Hotspot vlan3029" profile=hsprof-vlan-3029
add address-pool=hs-pool-vlan-3030 addresses-per-mac=unlimited disabled=no interface="3030. " keepalive-timeout=1h login-timeout=1m name="Hotspot vlan3030" profile=hsprof-vlan-3030

/ppp profile
add dns-server=172.130.21.1 local-address=172.130.21.1 name="PPPoE Vlan 3021" remote-address=PPPoE-vlan-3021
add dns-server=172.130.22.1 local-address=172.130.22.1 name="PPPoE Vlan 3022" remote-address=PPPoE-vlan-3022
add dns-server=172.130.23.1 local-address=172.130.23.1 name="PPPoE Vlan 3023" remote-address=PPPoE-vlan-3023
add dns-server=172.130.24.1 local-address=172.130.24.1 name="PPPoE Vlan 3024" remote-address=PPPoE-vlan-3024
add dns-server=172.130.25.1 local-address=172.130.25.1 name="PPPoE Vlan 3025" remote-address=PPPoE-vlan-3025
add dns-server=172.130.26.1 local-address=172.130.26.1 name="PPPoE Vlan 3026" remote-address=PPPoE-vlan-3026
add dns-server=172.130.27.1 local-address=172.130.27.1 name="PPPoE Vlan 3027" remote-address=PPPoE-vlan-3027
add dns-server=172.130.28.1 local-address=172.130.28.1 name="PPPoE Vlan 3028" remote-address=PPPoE-vlan-3028
add dns-server=172.130.29.1 local-address=172.130.29.1 name="PPPoE Vlan 3029" remote-address=PPPoE-vlan-3029
add dns-server=172.130.30.1 local-address=172.130.30.1 name="PPPoE Vlan 3030" remote-address=PPPoE-vlan-3030

/interface pppoe-server server
add authentication=pap default-profile="PPPoE Vlan 3021" disabled=no interface="3021. " max-mru=1480 max-mtu=1480 mrru=1600 service-name="PPPoE Vlan 3021"
add authentication=pap default-profile="PPPoE Vlan 3022" disabled=no interface="3022. " max-mru=1480 max-mtu=1480 mrru=1600 service-name="PPPoE Vlan 3022"
add authentication=pap default-profile="PPPoE Vlan 3023" disabled=no interface="3023. " max-mru=1480 max-mtu=1480 mrru=1600 service-name="PPPoE Vlan 3023"
add authentication=pap default-profile="PPPoE Vlan 3024" disabled=no interface="3024. " max-mru=1480 max-mtu=1480 mrru=1600 service-name="PPPoE Vlan 3024"
add authentication=pap default-profile="PPPoE Vlan 3025" disabled=no interface="3025. " max-mru=1480 max-mtu=1480 mrru=1600 service-name="PPPoE Vlan 3025"
add authentication=pap default-profile="PPPoE Vlan 3026" disabled=no interface="3026. " max-mru=1480 max-mtu=1480 mrru=1600 service-name="PPPoE Vlan 3026"
add authentication=pap default-profile="PPPoE Vlan 3027" disabled=no interface="3027. " max-mru=1480 max-mtu=1480 mrru=1600 service-name="PPPoE Vlan 3027"
add authentication=pap default-profile="PPPoE Vlan 3028" disabled=no interface="3028. " max-mru=1480 max-mtu=1480 mrru=1600 service-name="PPPoE Vlan 3028"
add authentication=pap default-profile="PPPoE Vlan 3029" disabled=no interface="3029. " max-mru=1480 max-mtu=1480 mrru=1600 service-name="PPPoE Vlan 3029"
add authentication=pap default-profile="PPPoE Vlan 3030" disabled=no interface="3030. " max-mru=1480 max-mtu=1480 mrru=1600 service-name="PPPoE Vlan 3030"

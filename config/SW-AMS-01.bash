# CONFIGURANDO INTERFACE COM A OPERADORA

system-view

vlan 50
 quit

interface vlanif 50
 ip address 172.28.255.246 255.255.255.252

interface GigabitEthernet0/0/1 
 port link-type trunk
 port trunk allow-pass vlan 50

# CONFIGURANDO REDE LAN 

vlan 40
 quit
interface vlanif 40
 ip address 10.10.40.1 255.255.255.0
 quit
interface GigabitEthernet0/0/24 
 port link-type access
 port default vlan 40
interface GigabitEthernet0/0/23
 port link-type access
 port default vlan 40
 quit

ip route-static 0.0.0.0 0.0.0.0 172.28.255.245

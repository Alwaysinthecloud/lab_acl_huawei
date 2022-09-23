# CONFIGURANDO INTERFACE COM A OPERADORA

system view
ospf 1 
 area 0 
 quit

interface vlanif 50
 ip address 172.28.255.254 255.255.255.252
 ospf network-type p2p
 ospf enable 1 area 0.0.0.0

interface GigabitEthernet0/0/1 
 port link-type trunk
 port trunk allow-pass vlan 50
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

# CONFIGURANDO REDE LAN 

vlan 10
 quit
interface vlanif 10
 ip address 10.10.10.1 255.255.255.0
 quit
interface GigabitEthernet0/0/24 
 port link-type access
 port default vlan 10
interface GigabitEthernet0/0/23
 port link-type access
 port default vlan 10
 quit
interface GigabitEthernet0/0/22
 port link-type access
 port default vlan 10
 quit

ip route-static 0.0.0.0 0.0.0.0 172.28.255.253

# CRIAÇÃO E APLICAÇÃO DA ACL

acl name ACL-PROTECAO-SIP-5060
 rule 20 permit ip source 10.10.10.253 0 destination 10.10.60.254 0
 rule 30 deny tcp destination 10.10.60.254 0 destination-port eq 5060

acl name ACL-PROTECAO-ICMP
  rule 20 permit icmp source 10.10.10.253 0 destination 10.10.60.254 0 
  rule 30 deny icmp destination 10.10.60.254 0

traffic-filter inbound acl name ACL-PROTECAO-ICMP
traffic-filter inbound acl name ACL-PROTECAO-SIP-5060
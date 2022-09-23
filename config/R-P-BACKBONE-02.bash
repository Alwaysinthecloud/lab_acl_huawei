# CONFIGURAÇÃO DA LOOPBACK E DAS INTERFACES DO BACKBONE
system-view
sysname R-PE-BACKBONE-02
interface loopback 0
 ip address 172.26.255.3 255.255.255.255 
 ospf enable area 0

interface GigabitEthernet0/0/1
 ip address 172.27.255.6 255.255.255.252
 ospf network-type p2p
 ospf enable 1 area 0.0.0.0

interface GigabitEthernet0/0/0
 ip address 172.27.255.9 255.255.255.252
 ospf network-type p2p
 ospf enable 1 area 0.0.0.0
 quit

ospf 1 
 import-route static
 area 0
 quit

# CONFIGURAÇÃO DAS INTERFACES DO PE COM OS CLIENTES

vlan 50
 quit

interface GigabitEthernet0/0/3.50
 dot1q termination vid 50
 ip address 172.28.255.249 255.255.255.252

ip route-static 10.10.60.0 255.255.255.0 172.28.255.250


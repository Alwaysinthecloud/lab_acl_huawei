# CONFIGURAÇÃO DA LOOPBACK E DAS INTERFACES DO BACKBONE
system-view
sysname R-PE-AMSTERDA-01
interface loopback 0
 ip address 172.26.255.2 255.255.255.255 
 ospf enable area 0

interface GigabitEthernet0/0/0
 ip address 172.27.255.5 255.255.255.252
 ospf network-type p2p
 ospf enable 1 area 0.0.0.0

interface GigabitEthernet0/0/1
 ip address 172.27.255.2 255.255.255.252
 ospf network-type p2p
 ospf enable 1 area 0.0.0.0
 quit
 
ospf 1
 import-route static
 area 0 

# CONFIGURAÇÃO DAS INTERFACES DO PE COM OS CLIENTES
interface GigabitEthernet0/0/3.50
 dot1q termination vid 50
 ip address 172.28.255.253 255.255.255.252
 quit

ip route-static 10.10.10.0 255.255.255.0 172.28.255.254

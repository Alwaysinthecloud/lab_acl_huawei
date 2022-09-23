# CONFIGURAÇÃO DA LOOPBACK E DAS INTERFACES DO BACKBONE
system-view
sysname R-PE-AMSTERDA-02
interface loopback 0
 ip address 172.26.255.4 255.255.255.255 
 ospf enable area 0

interface GigabitEthernet0/0/1
 ip address 172.27.255.10 255.255.255.252
 ospf network-type p2p
 ospf enable 1 area 0.0.0.0

interface GigabitEthernet0/0/0
 ip address 172.27.255.13 255.255.255.252
 ospf network-type p2p
 ospf enable 1 area 0.0.0.0
 quit
ospf 1
 import-route static
 area 0

# CONFIGURAÇÃO DAS INTERFACES DO PE COM OS CLIENTES
interface GigabitEthernet0/0/3.50
 dot1q termination vid 50
 ip address 172.28.255.245 255.255.255.252
 quit

ip route-static 10.10.40.0 24 172.28.255.246
 
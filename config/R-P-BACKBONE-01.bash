# CONFIGURAÇÃO DA LOOPBACK E DAS INTERFACES DO BACKBONE
system-view
sysname R-P-BACKBONE-01
interface loopback 0
 ip address 172.26.255.1 255.255.255.255 
 ospf enable area 0

interface GigabitEthernet0/0/0
 ip address 172.27.255.1 255.255.255.252
 ospf network-type p2p
 ospf enable 1 area 0.0.0.0

interface GigabitEthernet0/0/1
 ip address 172.27.255.14 255.255.255.252
 ospf network-type p2p
 ospf enable 1 area 0.0.0.0
 quit
ospf 1
 area 0 





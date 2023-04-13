#! /usr/bin/python3

import socket
from chord_tools import *

IpClient = 'pc-u3-305-9'


moi = Noeud()

moi.Port = 8001
moi.myKey = 50
myIp = socket.gethostname()
moi.host = myIp

moi.IpSuivant = "pc-u3-305-09"
moi.PortSuivant = 9000
moi.IdSuivant = 200

moi.IpPrecedent = "pc-u3-305-09"
moi.PortPrecedent = 9000
moi.IdPrecedent = 200

print(host)




with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as serversocket:
    serversocket.bind(('', 8001))
    set(150, 10, moi)
    serversocket.listen(5)
    print('listening on port:', serversocket.getsockname()[1])
    json_data = json_recv(clientsocket)
    print(json_data)
    if (json_data['request'] == 'QUERY'):
        lookup (json_data['ip'],json_data['port'], json_data['id'])
    json_send(IpSuivant, PortSuivant, 42)

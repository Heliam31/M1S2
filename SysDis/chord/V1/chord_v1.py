#! /usr/bin/python3
#cd CurrentWork/M1S2/SysDis/chord
import socket
from chord_tools import *

IpClient = 'pc-u3-305-9'


moi = Noeud()

moi.port = 8001
moi.key = 50
myIp = socket.gethostname()
moi.ip = myIp

moi.IpSuivant = "localhost"         #"pc-u3-305-09"
moi.PortSuivant = 9000
moi.IdSuivant = 200

moi.IpPrecedent = "localhost"       #"pc-u3-305-09"
moi.PortPrecedent = 9000
moi.IdPrecedent = 200

moi.liRand = [moi.key, moi. IdSuivant]

print(myIp)

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as serversocket:
    serversocket.bind(('', moi.port))
    moi.set(45,25)
    serversocket.listen(1)
    print('listening on port:', serversocket.getsockname()[1])
    while True:
        (clientsocket, address) = serversocket.accept()
        json_data = json_recv(clientsocket)
        print(json_data)
        if (json_data['request'] == 'QUERY'):
            moi.lookup (json_data['ip'],json_data['port'], json_data['id'])
        

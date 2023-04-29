#! /usr/bin/python3

import socket
from chord_tools import *

IpClient = 'pc-u3-305-9'


moi = Noeud()

moi.port = 9000
moi.key = 200
myIp = socket.gethostname()
moi.ip = myIp

moi.IpSuivant = "localhost"         #"pc-u3-305-09"
moi.PortSuivant = 8001
moi.IdSuivant = 50

moi.IpPrecedent = "localhost"       #"pc-u3-305-09"
moi.PortPrecedent = 8500
moi.IdPrecedent = 150
moi.liRand = [moi.key, moi. IdSuivant, moi.IdPrecedent]
print(myIp)

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as serversocket:
    serversocket.bind(('', moi.port))
    moi.set(180,25)
    serversocket.settimeout(5)
    serversocket.listen(1)
    print('listening on port:', serversocket.getsockname()[1])
    while True:
        (clientsocket, address) = serversocket.accept()
        json_data = json_recv(clientsocket)
        print(json_data)
        if (json_data['request'] == 'JOIN'):
            moi.check(json_data['ip'],json_data['port'], -1)
        if (json_data['request'] == 'CHECK'):
            moi.check(json_data['ip'],json_data['port'], json_data['id'])
        if (json_data['request'] == 'UPDATE'):
            moi.update(json_data['new_ip'],json_data['new_port'], json_data['new_id'])
        if (json_data['request'] == 'SET'):
            moi.set(json_data['key'],json_data['value'])
        moi.print()

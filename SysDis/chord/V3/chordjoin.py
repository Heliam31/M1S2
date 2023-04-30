#! /usr/bin/python3
#cd Desktop/M1S2/SysDis/chord/V3

import socket
from chord_tools import *

moi = Noeud()

moi.port = 8002
moi.ip = socket.gethostname()

moi.join("localhost", 9001, moi.ip, moi.port)
moi.print()

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as serversocket:
    serversocket.bind(('', moi.port))
    moi.print()
    serversocket.settimeout(5)
    serversocket.listen(5)
    print('listening on port:', serversocket.getsockname()[1])
    while True:
        (clientsocket, address) = serversocket.accept()
        json_data = json_recv(clientsocket)
        print(json_data)
        if (json_data['request'] == 'QUERY'):
            moi.lookup (json_data['ip'],json_data['port'], json_data['id'])
        if (json_data['request'] == 'LOOKUP'):
            moi.lookup (json_data['ip'],json_data['port'], json_data['id'])
        if (json_data['request'] == 'JOIN'):
            moi.check(json_data['ip'],json_data['port'], -1)
        if (json_data['request'] == 'CHECK'):
            moi.check(json_data['ip'],json_data['port'], json_data['id'])
        if (json_data['request'] == 'UPDATE'):
            moi.update(serversocket, json_data['new_ip'],json_data['new_port'], json_data['new_id'])
        if (json_data['request'] == 'SET'):
            moi.set(json_data['key'],json_data['value'])
        if (json_data['request']) == 'WHOIS':
            moi.whois(json_data['ip'],json_data['port'], json_data['id_wanted'])
        moi.print()
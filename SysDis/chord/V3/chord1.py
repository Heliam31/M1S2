#! /usr/bin/python3
#cd CurrentWork/M1S2/SysDis/chord
import socket
from chord_tools_Reel import *


IpClient = 'pc-u3-305-9'


moi = Noeud()

moi.port = 8001
moi.key = 50
myIp = socket.gethostname()
moi.ip = myIp

i=1
cpt=1
while i <= (65536/2)% 65536:
    moi.TableVois[moi.key+i] = ["localhost" , 9000, 500]
    i=2**cpt
    cpt+=1

print("oui: ",moi.TableVois[moi.key+((65536/2)% 65536)])

moi.liRand = [moi.key, 500]

print(myIp)

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as serversocket:
    serversocket.bind(('', moi.port))
    moi.set(45,25)
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
            moi.update(json_data['new_ip'],json_data['new_port'], json_data['new_id'])
        if (json_data['request'] == 'SET'):
            moi.set(json_data['key'],json_data['value'])
        moi.print()    

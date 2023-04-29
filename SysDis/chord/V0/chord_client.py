#! /usr/bin/python3
import random
import socket
import threading
from chord_tools import *

IpClient = 'pc-u3-305-10'


moi = Noeud()

moi.Port = 9000
moi.myKey = 200
myIp = socket.gethostname()
moi.host = myIp

moi.IpSuivant = "localhost"            #"pc-u3-305-10"
moi.PortSuivant = 8001
moi.IdSuivant = 50

moi.IpPrecedent = "2001:861:8c81:5e70:45e7:1403:a224:f4b4"                      #"pc-u3-305-10"
moi.PortPrecedent = 8001
moi.IdPrecedent = 50

print(myIp)

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as serversocket:
    serversocket.bind(('', moi.Port))

    serversocket.listen(5)
    print('listening on port:', serversocket.getsockname()[1])
    while True:
        (clientsocket, address) = serversocket.accept()
        json_data = json_recv(clientsocket)
    if (json_data['request'] == 'SET'):
        moi.set(json_data['key'],json_data['value'])    
k = random.randint(1, 64)   
query('localhost', moi.PortSuivant, k)
print(k)
'''
data = [{'test':22}, 'other test', 88]
for _ in range(3):
    json_send('localhost', 8001, data)
'''

 
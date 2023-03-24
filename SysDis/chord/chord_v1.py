#! /usr/bin/python3

import socket
from chord_tools import *

myIp = '130.120.232.10'
IpClient = '130.120.232.9'
host = socket.gethostname()
print(host)


with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as serversocket:
    serversocket.bind(('', 8001))
    serversocket.listen(5)
    print('listening on port:', serversocket.getsockname()[1])
    while True:
        (clientsocket, address) = serversocket.accept()
        print('accept')
        json_data = json_recv(clientsocket)
        print(json_data)
        json_send('localhost', 9000, 42)

#! /usr/bin/python3

import socket
from chord_tools import *

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as serversocket:
    serversocket.bind(('', 8001))
    serversocket.listen(5)
    print('listening on port:', serversocket.getsockname()[1])
    while True:
        (clientsocket, address) = serversocket.accept()
        json_data = json_recv(clientsocket)
        print(json_data)

        json_send('localhost', 9000, 42)


#main du client
# def printer():
#     with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as serversocket:
#         serversocket.bind(('', moi.Port))
#         serversocket.listen(5)
#         print('listening on port:', serversocket.getsockname()[1])
#         while True:
#             (clientsocket, address) = serversocket.accept()
#             json_data = json_recv(clientsocket)
#             print(json_data)

# # printer_thread = threading.Thread(target=printer)
# # printer_thread.start()
#! /usr/bin/python3

import socket
from chord_tools import *

IpClient = 'pc-u3-305-9'


moi = Noeud()

moi.port = 8600
moi.ip = socket.gethostname()

moi.join("localhost", 9000, moi.ip, moi.port)
moi.set(150,15)
moi.print()

        

            
                    
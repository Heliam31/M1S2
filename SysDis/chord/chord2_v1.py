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
moi.PortPrecedent = 8001
moi.IdPrecedent = 50
moi.liRand = [moi.key, moi. IdSuivant]
print(myIp)


print(query(moi.IpSuivant, moi.PortSuivant, moi.ip,moi.port, 45))

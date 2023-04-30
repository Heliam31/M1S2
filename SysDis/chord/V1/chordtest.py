#! /usr/bin/python3

import socket
import random
from chord_tools import *

IpClient = 'pc-u3-305-9'


moi = Noeud()

moi.port = 9000
moi.key = 51
myIp = socket.gethostname()
moi.ip = myIp

moi.IpSuivant = "localhost"         #"pc-u3-305-09"
moi.PortSuivant = 8001
moi.IdSuivant = 50

moi.IpPrecedent = "localhost"       #"pc-u3-305-09"
moi.PortPrecedent = 8001
moi.IdPrecedent = 50
moi.liRand = [moi.key]
print(myIp)

for i in range(100):
    moi.set(random.randint(52,65535), random.randint(0,50))
    
for i in range(100):
    query(moi.IpSuivant, moi.PortSuivant, moi.ip,moi.port, random.randint(0,65535))



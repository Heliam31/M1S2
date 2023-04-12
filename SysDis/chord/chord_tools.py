import socket
import json

def json_recv(clientsocket):
    data = b''
    while True:
        tmp = clientsocket.recv(1024)
        if tmp == b'':
            break
        data += tmp
    return json.loads(data)
                
def json_send(ip, port, data):
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.connect((ip, port))
        s.send(json.dumps(data).encode())

class Noeud:
    def __init__(self):
        self.IpSuivant = 0
        self.PortSuivant = 0
        self.IdSuivant = 0
        self.IpPrecedent = 0
        self.PortPrecedent = 0
        self.IdPrecedent = 0
        self.Port = 0
        self.host = 0
        self.myKey = 0
        self.data = {}

    def is_child (id, moi):
        if (moi.IdPrecedent > moi.myKey):
            if(id <= moi.myKey or id > moi.IdPrecedent):
                return 1
            else:
                return 0
        else:
            if(id <= moi.myKey and id > moi.IdPrecedent):
                return 1
            else:
                return 0

    #-----------------Pour le lookup----------------------------------

    def query (ip,port, id, moi):
        data = {    'request' : 'QUERY',
                        'ip' : ip,
                        'port' : port,
                        'id' : id
                    }
        json_send(moi.IpSuivant,moi.PortSuivant,data)

        #utilisé par le node qui fait la requete

    def response (id, present, value, ip, port):
        data = {    'request' : 'RESPONSE',
                        'id' : id,
                        'present' : present,
                        'value' : value
                    }
        json_send(ip,port,data) 
        #utilisé par le noeud qui a le id, present boolean si il y a bien l'id, value optionnel
        return 0

    def lookup (ip,port, id, moi):
        if (is_child (id)):
            response(id, 1, moi.data[id], ip, port)
        #else if ():
        #    response(id, 0, "0", ip, port)
        else:
            sendaj = {    'request' : 'LOOKUP',
                            'ip' : ip,
                            'port' : port,
                            'id' : id
                        }
            json_send(moi.IpSuivant,moi.PortSuivant,sendaj)
        #utilisé par nodes dans le chord pour chercher id parmis les nodes
        
    #--------------------Pour le join----------------------------------

    def join(ip, port):
        return 0

    def check(ip, port, id):
        #call rand() to generate ‘id’ if the first node, then send to the correct node
        return 0

    def nav():
        #-> “NonAvailable”, sent to the external node asking to join
        return 0

    def ok(ip_pred, port_pred, id_pred, ip_succ, port_succ, id_succ, data):
        #-> sent to the external node asking join
        return 0

    def update(ip_new, port_new, id_new):
        #-> sent to the previous node : if that node is impacted, update its TV and send to the previous node again (else: stop)
        return 0

    #--------------------Modif de valeur----------------------------------

    def set(key, value, moi):
        #-> if the node does not own the key, send it to the next node. No acknowledgement
        if (is_child (id)):
            moi.data[key] = value
        else:
            sendaj = {    'request' : 'SET',
                            'key' : key,
                            'value' : value
                        }
            json_send(moi.IpSuivant,moi.PortSuivant,sendaj)
        return 0

    #-----------------------Pour le quit----------------------------------

    def quit(nb_query, nb_set, nb_management, ip, port) :
        #nb_query 	: add to the variable how many ‘query’ and ‘lookup’ the node has used, then send to the next node 
        #nb_set 	: add to the variable how many ‘set’ the node has used, then send to the next node
        #nb_management : add to the variable how many of ‘everything else’ the node has used, then send to the next node
        #ip, port 	: of the external node
        return 0

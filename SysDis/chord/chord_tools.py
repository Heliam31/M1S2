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

#-----------------Pour le lookup----------------------------------

def query (ip,port, id):
    data = {    'request' : 'QUERY',
                    'ip' : ip,
                    'port' : port,
                    'id' : id
                }
    json_send(ip,port,data)

    #utilisé par le node qui fait la requete


def lookup (ip,port, id):
    data = {    'request' : 'LOOKUP',
                    'ip' : ip,
                    'port' : port,
                    'id' : id
                }
    json_send(ip,port,data)
    #utilisé par nodes dans le chord pour chercher id parmis les nodes
    

def response (id, present, value):
    data = {    'request' : 'RESPONSE',
                    'ip' : ip,
                    'present' : present,
                    'value' : value
                }
    json_send(ip,port,data) 
    #utilisé par le noeud qui a le id, present boolean si il y a bien l'id, value optionnel
    return 0
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

def set(key, value):
    #-> if the node does not own the key, send it to the next node. No acknowledgement
    return 0

#-----------------------Pour le quit----------------------------------

def quit(nb_query, nb_set, nb_management, ip, port) :
    #nb_query 	: add to the variable how many ‘query’ and ‘lookup’ the node has used, then send to the next node 
    #nb_set 	: add to the variable how many ‘set’ the node has used, then send to the next node
    #nb_management : add to the variable how many of ‘everything else’ the node has used, then send to the next node
    #ip, port 	: of the external node
    return 0

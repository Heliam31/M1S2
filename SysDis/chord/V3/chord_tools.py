import socket
import json
import random


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
def query (ipS, portS, ip,port, id):
    print("[QUERY] : demande de la valeur à l'id ", id)

    data = {    'request' : 'QUERY',
                    'ip' : ip,
                    'port' : port,
                    'id' : id
                }
    json_send(ipS,portS,data)
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as serversocket:
        serversocket.bind(('', port))
        serversocket.settimeout(10)
        serversocket.listen(5)
        print('listening on port:', serversocket.getsockname()[1])
        while True:
            (clientsocket, address) = serversocket.accept()
            print("[QUERY] : nouvelle connexion")
            json_data = json_recv(clientsocket)
            if (json_data['request'] == 'RESPONSE'):
                print("[QUERY] : Réponse à notre demande")
                if(json_data['present'] == 1):
                    return json_data['value']  
                else:
                    return "pas de valeur"


    
class Noeud:
    def __init__(self):
        self.IpSuivant = 0
        self.PortSuivant = 0
        self.IdSuivant = 0
        self.IpPrecedent = 0
        self.PortPrecedent = 0
        self.IdPrecedent = 0
        self.TableVois = {}
        self.port = 0
        self.ip = 0
        self.key = 0
        self.data = {}
        self.nb_query = 0
        self.nb_set = 0
        self.nb_management = 0
        self.liRand = []

    def is_child (self,id):
        if (self.IdPrecedent > self.key):
            if((id <= self.key) or id > (self.IdPrecedent)):
                return 1
            else:
                return 0
        else:
            if(id <= self.key and id > self.IdPrecedent):
                return 1
            else:
                return 0

    def rand (self):
        if len(self.liRand) == 65536:
            return -1
        else:
            res = random.randint(0,65535)
            val = 0
            while(val == 0):
                if res in self.liRand:
                    res = random.randint(0,65535)
                else:
                    val = 1
            return res

    def print(self):
        print("[PRINT]: Ip suivant: ", self.IpSuivant)
        print("[PRINT]: Port suivant: ",self.PortSuivant)
        print("[PRINT]: Id suivant: ",self.IdSuivant)
        print("[PRINT]: Ip Precédent: ",self.IpPrecedent)
        print("[PRINT]: Port Precédent: ",self.PortPrecedent)
        print("[PRINT]: Id Precédent: ",self.IdPrecedent)
        print("[PRINT]: Table de voisinnage: ",self.TableVois)
        print("[PRINT]: mon Port: ",self.port)
        print("[PRINT]: mon Ip: ",self.ip )
        print("[PRINT]: ma clé: ",self.key )
        print("[PRINT]: mes données: ",self.data )
        print("[PRINT]: nombre de query: ",self.nb_query )
        print("[PRINT]: nombre de set: ",self.nb_set )
        print("[PRINT]: nombre de managment: ",self.nb_management)
    #-----------------Pour le lookup----------------------------------

   

    def response (self, id, present, value, ip, port):
        print("[RESPONSE] : Renvoi de la valeur au client")
        data = {    'request' : 'RESPONSE',
                        'id' : id,
                        'present' : present,
                        'value' : value
                    }
        json_send(ip,port,data) 
        #utilisé par le noeud qui a le id, present boolean si il y a bien l'id, value optionnel
        return 0

    def lookup (self,ip,port, id):
        print("[LOOKUP] : recherche de l'id ", id," dans mes valeurs")
        if (self.is_child(id)):
            print("[LOOKUP] : l'id est le miens")
            if (id in self.data):
                print("[LOOKUP] : il a une valeur")
                self.response(id, 1, self.data[id], ip, port)
            else:
                print("[LOOKUP] : Pas de valeur")
                self.response(id, 0, "", ip, port)  
        else:
            sendaj = {    'request' : 'LOOKUP',
                            'ip' : ip,
                            'port' : port,
                            'id' : id
                        }
            json_send(self.IpSuivant,self.PortSuivant,sendaj)
        self.nb_query += 1
        #utilisé par nodes dans le chord pour chercher id parmis les nodes
        
    #--------------------Pour le join----------------------------------

    def join(self, ipS, portS, ip, port):
        print("[JOIN] : tentative de rejoindre")
        data = {    'request' : 'JOIN',
                    'ip' : ip,
                    'port' : port
                }
        json_send(ipS,portS,data)
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as serversocket:
            serversocket.bind(('', self.port))
            serversocket.listen(5)
            serversocket.settimeout(15)
            print('listening on port:', serversocket.getsockname()[1])
            while True:
                (clientsocket, address) = serversocket.accept()
                json_data = json_recv(clientsocket)
                print(json_data)
                if (json_data['request'] == 'NAV'):
                    print("[JOIN] : Système non dispo rééssayer plus tard")
                if (json_data['request'] == 'OK'):
                    self.IpPrecedent = json_data['previous_ip']
                    self.PortPrecedent = json_data['previous_port']
                    self.IdPrecedent = json_data['previous_id']
                    self.IpSuivant = json_data['next_ip']
                    self.PortSuivant = json_data['next_port']
                    self.IdSuivant = json_data['next_id']
                    self.id = json_data['id']
                    self.data = json_data['data']
                    print("[JOIN] : mon ipPrec ", self.IpPrecedent)
                    print("[JOIN] : mon portPrec ", self.PortPrecedent)
                    print("[JOIN] : mon idPrec ", self.IdPrecedent)
                    print("[JOIN] : mon ipSuiv ", self.IpSuivant)
                    print("[JOIN] : mon PortSuiv ", self.PortSuivant)
                    print("[JOIN] : mon idSuiv ", self.IdSuivant)
                    print("[JOIN] : mon id: ", self.id)
                    print("[JOIN] : mes données: ", self.data)
                    return 0
    
    def check(self, ip, port, id):
        print("[CHECK] : recherche de l'id ", id," dans mes valeurs pour un join")
        if id==-1:
            idR = self.rand()
            if idR == -1:
                self.nav(ip,port)
                return 0
        else:
            idR = id
        if (self.is_child(idR)):
            print("[CHECK] : l'id ", id," fais partie de mes valeurs")
            dataNew = {}
            liDic=[]
            if (idR > self.key):
                for i in self.data:
                    if i > self.IdPrecedent:
                        dataNew[i] = self.data[i]
                        liDic.append(i)
                for i in liDic:
                    self.data.pop(i)
            else:
                for i in self.data:
                    if i <= id:
                        dataNew[i] = self.data[i]
                        liDic.append(i)
                for i in liDic:
                    self.data.pop(i)
            print("[CHECK] : data mise à jour")
            print("[CHECK] : Envoi à l'emetteur confirmation de join et sa nouvelle tablea de voisinnage")
            self.ok(self.IpPrecedent, self.PortPrecedent, self.IdPrecedent, self.ip, self.port, self.key, ip, port, id, dataNew)
            sendaj = {    'request' : 'UPDATE',
                    'new_ip' : ip,
                    'new_port' : port,
                    'new_id' : id
                }
            json_send(self.IpPrecedent,self.PortPrecedent,sendaj)
            self.IpPrecedent = ip
            self.PortPrecedent = port
            self.IdPrecedent = id
            print("[CHECK] : Table de voisinnage mise à jour")
            self.nb_management += 1
        else:
            print("[CHECK] : L'id ", id," ne fais pas partie de mes valeurs")
            sendaj = {    'request' : 'CHECK',
                    'ip' : ip,
                    'port' : port,
                    'id' : idR
                }
            json_send(self.IpSuivant,self.PortSuivant,sendaj)
            print("[CHECK] : Envoi à mon prochain")
            self.nb_management += 1
            return 0
        
    def create(self):
        print("[CREATE] : Creation table de voisinnage")
        i=1
        cpt=1
        while i <= (65536/2)% 65536:
            change = 0
            if self.is_child((self.key+i)% 65536):
                self.TableVois[(self.key+i)% 65536] = [self.ip, self.port, self.key]
            else:
                if (self.IdSuivant > self.key):
                    if(((self.key+i)% 65536 <= self.key) or (self.key+i)% 65536 > (self.IdSuivant)):
                        self.TableVois[(self.key+i)% 65536] = [self.IpSuivant, self.PortSuivant, self.IdSuivant]
                    else:
                        change = 1
                else:
                    if((self.key+i)% 65536 <= self.key and (self.key+i)% 65536 > self.IdSuivant):
                        self.TableVois[(self.key+i)% 65536] = [self.IpSuivant, self.PortSuivant, self.IdSuivant]
                    else:
                        change = 1   
                if change == 1:    
                    self.TableVois[(self.key+i)% 65536] = [0, 0, 0]
                    data = {
                        "request" : "WHOIS",
                        "ip" : self.ip,
                        "port" : self.port,
                        "id_wanted" : ((self.key + i)% 65536)
                        }
                    json_send(self.IpPrecedent, self.PortPrecedent, data)
                    sortie = 0
                    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as serversocket:
                            serversocket.bind(('', self.port))
                            serversocket.settimeout(10)
                            serversocket.listen(5)
                            print('listening on port:', serversocket.getsockname()[1])
                            while sortie == 0:
                                (clientsocket, address) = serversocket.accept()
                                print("[CREATE/WHOIS] : nouvelle connexion")
                                json_data = json_recv(clientsocket)
                                if (json_data['request'] == 'IAM'):
                                    print("[CREATE/WHOIS] : Réponse à notre demande")
                                    self.TableVois[json_data['id_wanted']] = [json_data['ip'],json_data['port'],json_data['id']]
                                    sortie = 1
                i=2**cpt
                cpt+=1
        sendaj = {    'request' : 'UPDATE',
                    'new_ip' : self.ip,
                    'new_port' : self.port,
                    'new_id' : self.key
                }
        json_send(self.IpPrecedent, self.PortPrecedent, sendaj)

    def nav(self,ip,port):
        data = {'request' : 'NAV'}
        json_send(ip,port, data)
        self.nb_management += 1
        #-> “NonAvailable”, sent to the external node asking to join

    def ok(self, ip_pred, port_pred, id_pred, ip_succ, port_succ, id_succ, ip, port, id, data):
        print("[OK] : Envoi confirmation de join")
        sendaj = {    'request' : 'OK',
                    'previous_ip' : ip_pred,
                    'previous_port' : port_pred,
                    'previous_id' : id_pred,
                    'next_ip' : ip_succ,
                    'next_port' : port_succ,
                    'next_id' : id_succ,
                    'id' : id,
                    'data' : data
                }
        self.nb_management += 1
        json_send(ip,port,sendaj)


    def update(self,serversocket, ip_new, port_new, id_new):
        print("[UPDATE] : Mise à jour table de voisinnage")
        sendaj = {    'request' : 'UPDATE',
                    'new_ip' : ip_new,
                    'new_port' : port_new,
                    'new_id' : id_new
                }
        if self.IdSuivant != id_new:
            self.IpSuivant = ip_new
            self.PortSuivant = port_new
            self.IdSuivant = id_new
            print("[UPDATE] : nouveau suivant: ", id_new)
            print("[UPDATE] : table de voisinnage est changée")
        else:
            json_send(self.IpPrecedent, self.PortPrecedent, sendaj)
            print("[UPDATE] : table de voisinnage inchangée")
        self.nb_management += 1
        #-> sent to the previous node : if that node is impacted, update its TV and send to the previous node again (else: stop)

    #--------------------Modif de valeur----------------------------------

    def set(self,key, value):
        print("[SET] : set de la valeur ", value, " à l'id ", key)
        #-> if the node does not own the key, send it to the next node. No acknowledgement
        if (self.is_child(key)):
            self.data[key] = value
        else:
            sendaj = {    'request' : 'SET',
                            'key' : key,
                            'value' : value
                        }
            json_send(self.IpSuivant,self.PortSuivant,sendaj)
        self.nb_set += 1
        

    #-----------------------Pour le quit----------------------------------

    def quit(self, ip, port) :
        data = {    'query_count' : self.nb_query,
                    'set_count' : self.nb_set,
                    'management_count' : self.nb_management,
                    'ip' : ip ,
                    'port' : port
                }
        
        #nb_query 	: add to the variable how many ‘query’ and ‘lookup’ the node has used, then send to the next node 
        #nb_set 	: add to the variable how many ‘set’ the node has used, then send to the next node
        #nb_management : add to the variable how many of ‘everything else’ the node has used, then send to the next node
        #ip, port 	: of the external node
        return 0

#----------------------------------------WHOIS IAM-------------------------------------------------------------------------

    def whois(self, ip, port, id_wanted):
        print("[WHOIS]recherche du parent de l'id: ", id_wanted)
        data = {
                "request" : "WHOIS",
                "ip" : ip,
                "port" : port,
                "id_wanted" : id_wanted
                }
        
        if (self.is_child(id_wanted)):
            print("[WHOIS] c'est moi")
            self.iam(ip,port, id_wanted)
        else:
            print("[WHOIS] pas moi")
            i=1
            cpt=1
            trouve=0
            while i <= (65536/2)% 65536 and trouve==0:
                if (i == (65536/2)% 65536 ):
                    print("[WHOIS] envoi au suivant")
                    json_send(self.TableVois[(self.key+i)% 65536][0], self.TableVois[(self.key+i)% 65536][1], data)
                    trouve = 1
                else:
                    if ((self.key+i)% 65536) == id_wanted : #i = id_wanted
                        print("[WHOIS] envoi à celui qui a la bonne valeur")
                        json_send(self.TableVois[(self.key+i)% 65536][0], self.TableVois[(self.key+i)% 65536][1], data)
                        trouve = 1
                    if ((self.key+i)% 65536) > self.key and self.key < (self.key+(2**cpt))% 65536: #cas ou i et le suivant sont sous 0
                        if ((self.key+i)% 65536) < id_wanted and ((self.key+(2**cpt))% 65536) > id_wanted: #l'id wanted est entre eux
                            if self.TableVois[((self.key+i)% 65536)][2] == self.TableVois[((self.key+(2**cpt))% 65536)][2]:
                                print("[WHOIS] envoi au bon")
                                envoiiam = {
                                        "request" : "IAM",
                                        "ip" : self.TableVois[(self.key+(2**cpt))% 65536][0],
                                        "port" : self.TableVois[(self.key+(2**cpt))% 65536][1],
                                        "id" : self.TableVois[(self.key+(2**cpt))% 65536][2],
                                        "id_wanted" : id_wanted
                                        }
                                json_send(ip , port , envoiiam)
                                trouve = 1
                            else:
                                print("[WHOIS] envoi au bon ou très proche")
                                json_send(self.TableVois[(self.key+i)% 65536][0], self.TableVois[(self.key+i)% 65536][1], data)
                                trouve = 1
                    if ((self.key+i)% 65536) < self.key and self.key > (self.key+(2**cpt))% 65536:  # cas ou i et le suivant son apres 0      
                        if ((self.key+i)% 65536) < id_wanted and ((self.key+(2**cpt))% 65536) > id_wanted:
                            if self.TableVois[((self.key+i)% 65536)][2] == self.TableVois[((self.key+(2**cpt))% 65536)][2]:
                                print("[WHOIS] envoi au bon")
                                envoiiam = {
                                        "request" : "IAM",
                                        "ip" : self.TableVois[(self.key+(2**cpt))% 65536][0],
                                        "port" : self.TableVois[(self.key+(2**cpt))% 65536][1],
                                        "id" : self.TableVois[(self.key+(2**cpt))% 65536][2],
                                        "id_wanted" : id_wanted
                                        }
                                json_send(ip , port , envoiiam)
                                trouve = 1
                            else:
                                print("[WHOIS] envoi au bon ou très proche")
                                json_send(self.TableVois[(self.key+i)% 65536][0], self.TableVois[(self.key+i)% 65536][1], data)
                                trouve = 1
                    if ((self.key+i)% 65536) > self.key and self.key > (self.key+(2**cpt))% 65536: #cas ou i < 0 et suivant apres 0
                        if id_wanted > ((self.key+i)% 65536)  and id_wanted > ((self.key+(2**cpt))% 65536) : #id wanted présent, cote ppq 0
                            if self.TableVois[((self.key+i)% 65536)][2] == self.TableVois[((self.key+(2**cpt))% 65536)][2]:
                                print("[WHOIS] envoi au bon")
                                envoiiam = {
                                        "request" : "IAM",
                                        "ip" : self.TableVois[(self.key+(2**cpt))% 65536][0],
                                        "port" : self.TableVois[(self.key+(2**cpt))% 65536][1],
                                        "id" : self.TableVois[(self.key+(2**cpt))% 65536][2],
                                        "id_wanted" : id_wanted
                                        }
                                json_send(ip , port , envoiiam)
                                trouve = 1
                            else:
                                print("[WHOIS] envoi au bon ou très proche")
                                json_send(self.TableVois[(self.key+i)% 65536][0], self.TableVois[(self.key+i)% 65536][1], data)
                                trouve = 1
                        if id_wanted < ((self.key+i)% 65536)  and id_wanted < ((self.key+(2**cpt))% 65536) : #id wanted présent, cote pgq 0
                            if self.TableVois[((self.key+i)% 65536)][2] == self.TableVois[((self.key+(2**cpt))% 65536)][2]:
                                print("[WHOIS] envoi au bon")
                                envoiiam = {
                                        "request" : "IAM",
                                        "ip" : self.TableVois[(self.key+(2**cpt))% 65536][0],
                                        "port" : self.TableVois[(self.key+(2**cpt))% 65536][1],
                                        "id" : self.TableVois[(self.key+(2**cpt))% 65536][2],
                                        "id_wanted" : id_wanted
                                        }
                                json_send(ip , port , envoiiam)
                                trouve = 1
                            else:
                                print("[WHOIS] envoi au bon ou très proche")
                                json_send(self.TableVois[(self.key+i)% 65536][0], self.TableVois[(self.key+i)% 65536][1], data)
                                trouve = 1
                i=2**cpt
                cpt += 1

    def iam(self, ip, port, id_wanted):
        data = {
                "request" : "IAM",
                "ip" : self.ip,
                "port" : self.port,
                "id" : self.key,
                "id_wanted" : id_wanted
                }
        json_send(ip,port,data)
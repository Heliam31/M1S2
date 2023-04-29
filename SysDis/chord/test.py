dic = {}
dic[1] = 5
dic[3] = 2
dic[4] = 8
dic[5] = 4


bigdic = {}
liDic=[]
for i in dic:
                if i <= 3:
                    bigdic[i] = dic[i]
                    liDic.append(i)

for i in liDic:
    dic.pop(i)              

print(dic)
print(bigdic)
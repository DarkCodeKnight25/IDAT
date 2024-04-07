a=[20,9,7]
def procedimiento(lista1):
    contador=len(lista1)
    i=0
    while contador>0:
        print("*" * lista1[i])
        i=i+1
        contador=contador-1

procedimiento(a)
def proceso(lista1):
    for x in lista1:
        print("*" * x)
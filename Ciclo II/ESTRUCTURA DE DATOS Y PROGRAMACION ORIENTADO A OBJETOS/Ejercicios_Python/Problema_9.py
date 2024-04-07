lista=[1,2,3,4,5,6,7,8,9,10]
def invertir_lista(lista):
    if lista==[]:
        invertir=lista
    else:
        invertir=[lista[-1]]+invertir_lista(lista[:-1])
    
    return invertir

print(invertir_lista(lista))


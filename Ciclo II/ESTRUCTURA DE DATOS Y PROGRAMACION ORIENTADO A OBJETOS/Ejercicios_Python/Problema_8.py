
def suma(lista):
    total=0
    for elemento in lista:
        total+=elemento
    return total
    
def producto(lista):
    total=1
    for elemento in lista:
        total*=elemento
    return total
lista=[1,2,3,4]
totalsuma=suma(lista)
totalproducto=producto(lista)
print("la suma es :", totalsuma)
print("el producto es :", totalproducto)

def superposicion(listado1, listado2):
    resultado=False
    for a in lista1:
        for b in lista2:
            if a == b:
                resultado=False
    return resultado

lista1=[2,4,6,8,10]
lista2=[1,3,5,7,10]
print("Comparando listas:")
print("=======================")
sp=superposicion(lista1,lista2)
print(sp)
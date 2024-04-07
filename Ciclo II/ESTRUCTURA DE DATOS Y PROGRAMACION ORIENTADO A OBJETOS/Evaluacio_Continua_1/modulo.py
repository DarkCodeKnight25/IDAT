def multiplicarElementos(lista):
    producto=1
    for numero in lista:
        producto*=numero
    return producto

def masLetras(cadena):
    longitud = []
    for i in cadena.split():
        longitud.append((len(i), i))
    longitud.sort()
    return longitud[-1][1]
    
def eliminarVocales(cadena):
    vocales = ('a','e','i','o','u','A','E','I','O','U''á','é','í','ó','ú')
    for letra in vocales:
        cadena = cadena.replace(letra, "")
    return cadena 

def contarCaracteres(cadena):
    contador = {'Mayúsculas': 0,'Minúsculas': 0,'Números': 0}
    for i in cadena.replace(" ", ""):
        if i.isupper():
            contador['Mayúsculas'] += 1
        elif i.islower():
            contador['Minúsculas'] += 1
        else: 
            contador['Números'] += 1
    return contador
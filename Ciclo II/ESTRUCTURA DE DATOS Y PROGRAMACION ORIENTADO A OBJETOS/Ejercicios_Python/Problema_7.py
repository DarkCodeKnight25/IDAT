def num_vocales(frase):
    vocales="aeiouAEIOU"
    return set([c for c in frase if c in vocales])
print("Ingrese texto u oración :")
texto=input()
print(num_vocales(texto))
print("El numero de vocales es :",len(num_vocales(texto)))
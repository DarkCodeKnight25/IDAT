import random
numero=random.randint(1,100)
intentos=0
jugar=True
print("Adivina el numero")
while jugar:
    intentos=intentos+1
    if intentos<=3:
        eleccion=int(input("Di un numero :"))
        if eleccion==numero:
            print("Has ganado, has usado", intentos, "intentos.")
            jugar=False
        else:
            if eleccion>numero:
                print("demasiado alto. Llevas", intentos,"intentos")
            else:
                if eleccion<numero:
                    print("Demasiado bajo. Llevas", intentos,"intentos")
    else:
        print("Se te acabaron los intentos, perdiste")
        jugar=False
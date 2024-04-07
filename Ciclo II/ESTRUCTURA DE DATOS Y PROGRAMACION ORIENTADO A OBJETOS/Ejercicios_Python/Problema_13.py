import random
n=0
dado1=random.randint(1,6)
dado2=random.randint(1,6)
print(dado1)
print(dado2)
if dado1==3 and dado2==6:
    n=9
else:
    if dado1==4 and dado2==5:
        n=9
    else:
        if dado1==5 and dado2==4:
            n=9
        else:
            if dado1==6 and dado2==3:
                n=9
if n==9:
    print("has ganado")
else:
    print("Has perdido, sigue intentandolo")
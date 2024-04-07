def max_tres(a,b,c):
    if a>b and a>c:
        return a
    elif b>a and b>c:
        return b
    elif c>a and c>a:
        return c
    else:
        print("Son iguales")

num1=int(input("Numero1 :"))
num2=int(input("Numero2 :"))
num3=int(input("Numero3 :"))
if num1>num2 and num1>num3:
    mayor=num1
elif num2>num1 and num2>num3:
    mayor=num2
elif num3>num1 and num3>num2:
    mayor=num3
print("El numero mayor es :", mayor)
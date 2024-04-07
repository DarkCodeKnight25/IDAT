def max_dos(a,b):
    if a>b:
        return a
    elif b>a:
        return b
    else:
        return "Son iguales"

num1=int(input("Numero1 :"))
num2=int(input("Numero2 :"))
mayor=max_dos(num1,num2)
print("El numero mayor es :", mayor)

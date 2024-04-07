def vocal (c):
    if c =="a" or c =="e" or c =="i" or c =="o" or c=="u":
        return True
    else:
        return False

caracter = input("introduce una letra : ")
print(vocal(caracter))
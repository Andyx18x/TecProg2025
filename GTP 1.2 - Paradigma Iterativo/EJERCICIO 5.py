#Realiza un programa que genere y muestre la tabla de multiplicar de un número N introducido por el usuario

n = int(input("ingrese un numero: "))

for i in range(9+1):
    print(f"{n}x{i} = {n*i}" )
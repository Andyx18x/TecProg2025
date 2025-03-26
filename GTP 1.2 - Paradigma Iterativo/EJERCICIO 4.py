#Escribe un programa que pida al usuario N números y encuentre el máximo de ellos.

n = 4

mayor = int(input("ingrese un numero: "))
for i in range(n-1):
    num = int(input("ingrese un numero: "))
    if num>mayor:
        mayor = num

print(mayor)
#Desarrolla un programa que solicite al usuario N números y calcule su suma.

n = 4
suma = 0
for i in range(n):
    num = int(input("ingrese un numero: "))
    suma = suma + num

print(suma)
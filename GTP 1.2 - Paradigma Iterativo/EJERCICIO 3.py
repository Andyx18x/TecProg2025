#Crea un programa que lea N números del usuario y calcule su media

n = int(input("cuantos numeros desea promediar? "))

suma = 0
for i in range(n):
    num = int(input("ingrese un numero: "))
    suma = suma + num

print(suma/n)
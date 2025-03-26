#Escribe un programa que convierta un número entero N a binario

n = int(input("ingrese un numero: "))

binario = ''
while n-1 != 0:
    if n%2 == 0:
        binario+='0'
        n = n/2
    else:
        binario+='1'
        n = int(n/2) #para que la division no de con coma
binario+='1'
binario = binario[::-1] #da vuelta el binario
print(binario)

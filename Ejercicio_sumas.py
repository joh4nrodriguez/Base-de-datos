Nro=int(input("Ingrese numero inicial:"))
limite=int(input("Ingrese numero final:"))
suma=0
contador=0
for Nro in range (Nro,limite):
    if Nro % 2!=0:
        contador=contador+1
        suma+=Nro
        print(Nro)
print("La suma de los impares es igual a:",suma)
print("Hay",contador,"suma")
    
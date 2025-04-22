class Producto:
    def __init__(self, nombre: str, categoria: str):
        self.nombre = nombre
        self.categoria = categoria

class Carrito:
    def __init__(self, productos: list):
        self.productos = productos

def calcular_descuento(productos: list):
    for producto in productos:
        if producto.categoria == 'alimentos':  #Se rompe el principio de ocultacion al utilizar un atributo de otra clase
            print(f"Descuento del 10% en {producto.nombre}") #Principio de ocultacion
        elif producto.categoria == 'limpieza':
            print(f"Descuento del 5% en {producto.nombre}") #Principio de ocultacion
        # Añadir más condiciones para nuevos tipos de productos y descuentos
        
productos = [
Producto('manzanas', 'alimentos'),
Producto('jabón', 'limpieza')
]
carrito = Carrito(productos)
calcular_descuento(carrito.productos) #Aca se rompe el principio de ocultacion, tendria que haber un metodo mostrar_productos

#La función calcular_descuento depende directamente de la categoría y necesita ser modificada cada vez que agregás o eliminas una nueva. 
#Eso rompe el Principio de abierto/cerrado (OCP), porque obliga a cambiar código viejo para eliminar tipos de productos o agregar nuevos.



#Codigo modificado
from abc import ABC, abstractmethod
class Producto(ABC):
    def __init__(self, nombre: str):
        self.nombre = nombre
    @abstractmethod
    def calcular_descuento(self):
        pass
        
class ProductoAlimento(Producto):
    def calcular_descuento(self):
        print(f"Descuento del 10% en {self.nombre}")

class ProductoLimpieza(Producto):
    def calcular_descuento(self):
        print(f"Descuento del 5% en {self.nombre}")

class Carrito:
    def __init__(self, productos: list):
        self.productos = productos
    def aplicar_descuentos(self):
        for producto in self.productos:
            producto.calcular_descuento()
   

productos = [
ProductoAlimento("Manzanas"),
ProductoLimpieza("Jabon")
]
carrito = Carrito(productos)
carrito.aplicar_descuentos()

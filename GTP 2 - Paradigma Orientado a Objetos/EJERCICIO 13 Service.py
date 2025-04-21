class Dispositivo:
    def __init__(self, marca: str, modelo: str):
        self.marca = marca
        self.modelo = modelo

class Celular(Dispositivo):
    def __init__(self, marca: str, modelo: str, pantalla: bool):
        super().__init__(marca, modelo)
        self.pantalla = pantalla

class Tablet(Dispositivo):
    def __init__(self, marca: str, modelo: str, pantalla: bool, lapiz: bool):
        super().__init__(marca, modelo)
        self.pantalla = pantalla
        self.lapiz = lapiz

class Smartwatch(Dispositivo):
    def __init__(self, marca: str, modelo: str, pantalla: bool, gps: bool):
        super().__init__(marca, modelo)
        self.pantalla = pantalla
        self.gps = gps

def contar_piezas_reparacion(dispositivos: list):
    for dispositivo in dispositivos:
        if isinstance(dispositivo, Celular):
            print(contar_piezas_celular(dispositivo))
        elif isinstance(dispositivo, Tablet):
            print(contar_piezas_tablet(dispositivo))
        elif isinstance(dispositivo, Smartwatch):
            print(contar_piezas_smartwatch(dispositivo))

# Funciones para contar piezas de repuesto específicas para cada tipo de dispositivo
def contar_piezas_celular(celular: Celular):
    return "Piezas requeridas para reparar el celular"

def contar_piezas_tablet(tablet: Tablet):
    return "Piezas requeridas para reparar la tablet"

def contar_piezas_smartwatch(smartwatch: Smartwatch):
    return "Piezas requeridas para reparar el smartwatch"

# Ejemplo de uso
dispositivos = [
Celular("Samsung", "Galaxy S20", True),
Tablet("Apple", "iPad Pro", True, True),
Smartwatch("Apple", "Watch Series 6", True, True)
]
contar_piezas_reparacion(dispositivos)

#La funcion contar_piezas_reparacion depende directamente del tipo de dispositivo y necesita ser modificada cada vez que se 
#eliminan o agregan dispotivos nuevos, por lo tanto se viola el principio de abierto/cerrado (OCP).

#Codigo modificado:
from abc import ABC, abstractmethod

class Dispositivo(ABC):
    def __init__(self, marca: str, modelo: str):
        self.marca = marca
        self.modelo = modelo
    @abstractmethod
    def piezas_requeridas(self):
        pass

class Celular(Dispositivo):
    def __init__(self, marca: str, modelo: str, pantalla: bool):
        super().__init__(marca, modelo)
        self.pantalla = pantalla
    def piezas_requeridas(self):
        print("Piezas requeridas para reparar el celular")

class Tablet(Dispositivo):
    def __init__(self, marca: str, modelo: str, pantalla: bool, lapiz: bool):
        super().__init__(marca, modelo)
        self.pantalla = pantalla
        self.lapiz = lapiz
    def piezas_requeridas(self):
        print("Piezas requeridas para reparar la tablet")

class Smartwatch(Dispositivo):
    def __init__(self, marca: str, modelo: str, pantalla: bool, gps: bool):
        super().__init__(marca, modelo)
        self.pantalla = pantalla
        self.gps = gps
    def piezas_requeridas(self):
        print("Piezas requeridas para reparar el smartwatch")

def contar_piezas_requeridas(dispositivos: list):
    for dispositivo in dispositivos:
        dispositivo.piezas_requeridas()

#Ejemplo de uso
dispositivos = [
Celular("Samsung", "Galaxy S20", True),
Tablet("Apple", "iPad Pro", True, True),
Smartwatch("Apple", "Watch Series 6", True, True)
]
contar_piezas_requeridas(dispositivos)

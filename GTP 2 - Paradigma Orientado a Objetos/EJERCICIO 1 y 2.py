from datetime import datetime

class Persona:
    def __init__(self, nombre, apellido, fecha_nacimiento):
        self.nombre = nombre
        self.apellido = apellido
        self.fecha_nacimiento = datetime.strptime(fecha_nacimiento, "%d-%m-%Y")
    def _CalcularEdad(self):
        hoy = datetime.today()
        edad = hoy.year - self.fecha_nacimiento.year
        if (hoy.month, hoy.day) < (self.fecha_nacimiento.month, self.fecha_nacimiento.day):
            edad -= 1
        return edad
    def mostrar(self):
        hoy = datetime.today()
        cumple_este_anio = datetime(hoy.year, self.fecha_nacimiento.month, self.fecha_nacimiento.day)
        dia_cumple = cumple_este_anio.strftime("%d de %B")
        print(self.nombre, self.apellido,":", self._CalcularEdad(), dia_cumple)
    

class Principal:
    def __init__(self):
        pass
        
    def ejecutar(self):
        p1 = Persona("Andy", "Bonetti", "18-09-2003")
        p2 = Persona("Luca", "Bortolotto", "30-05-2004")
        print("Identidad persona 1:", id(p1))
        p1.mostrar()
        print("Identidad persona 2:", id(p2))
        p2.mostrar()
        if id(p1) == id(p2):
            print("Los objetos son iguales")

if __name__ == "__main__":
    principal = Principal()
    principal.ejecutar()
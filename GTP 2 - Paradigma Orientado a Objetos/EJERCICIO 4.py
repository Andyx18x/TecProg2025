# Agregue a la clase "Persona", creada en el Problema 2 un nuevo atributo que sea
# la clave personal o contraseña. Esta contraseña debe contener un string que se genere 
# con la clave  hasheada con SHA256. Por ejemplo, si la clave es "password", el atributo
# debe contener el valor "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8".
# Agregue una nueva funcionalidad a la clase "Persona" que valide la contraseña con un
# método que reciba como parámetro la contraseña a evaluar y la compare con el valor de la
# instancia. Este método debe devolver "Verdadero" si coincide y "Falso" en caso contrario.

from datetime import datetime
import hashlib

class Persona:
    def __init__(self, nombre, apellido, fecha_nacimiento, clave):
        self.nombre = nombre
        self.apellido = apellido
        self.fecha_nacimiento = datetime.strptime(fecha_nacimiento, "%d-%m-%Y")
        self.clave = hashlib.sha256(clave.encode('utf-8')).hexdigest()
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
        print("Clave:", self.clave)
    def validar_clave(self, clave):
        if self.clave == hashlib.sha256(clave.encode('utf-8')).hexdigest():
            return True
        else:
            return False

    

class Principal:
    def __init__(self):
        pass
        
    def ejecutar(self):
        p1 = Persona("Andy", "Bonetti", "18-09-2003", "andy2003")
        p2 = Persona("Luca", "Bortolotto", "30-05-2004", "luca2004")
        print("Identidad persona 1:", id(p1))
        p1.mostrar()
        print("Identidad persona 2:", id(p2))
        p2.mostrar()
        if id(p1) == id(p2):
            print("Los objetos son iguales")
        print(p1.validar_clave("andy2003"))
        print(p2.validar_clave("luca2000"))
        

if __name__ == "__main__":
    principal = Principal()
    principal.ejecutar()
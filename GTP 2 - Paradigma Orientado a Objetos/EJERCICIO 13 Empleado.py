class Empleado:
    def __init__(self, nombre, horas_trabajadas, tarifa_por_hora):
        self.nombre = nombre
        self.horas_trabajadas = horas_trabajadas
        self.tarifa_por_hora = tarifa_por_hora
    def calcular_salario(self):
        return self.horas_trabajadas * self.tarifa_por_hora
    def generar_reporte_desempenio(self):
    # Código para generar el reporte de desempeño
        pass

#Se viola el Principio de Responsabilidad Unica (SRP)
#Codigo modificado:

class Empleado:
    def __init__(self, nombre, horas_trabajadas, tarifa_por_hora):
        self.nombre = nombre
        self.horas_trabajadas = horas_trabajadas
        self.tarifa_por_hora = tarifa_por_hora
    def mostrar_horastrabajadas(self):
        return self.horas_trabajadas
    def mostrar_tarifaporhora(self):
        return self.tarifa_por_hora
    def mostrar_salario(self):
        salario = CalcularSalario(self)
        return salario.calcular()

class CalcularSalario():
    def __init__(self, empleado: Empleado):
        self.empleado = empleado
    def calcular(self):
        return self.empleado.mostrar_horastrabajadas() * self.empleado.mostrar_tarifaporhora()
    
class ReporteDesempenio:
    def __init__(self, empleado: Empleado):
        self.empleado = empleado
    def generar(self):
        # Lógica para generar el reporte de desempeño
        pass
        
if __name__ == "__main__":
    e1 = Empleado("Juan",10,100)
    print(f"Salario: {e1.mostrar_salario()}")
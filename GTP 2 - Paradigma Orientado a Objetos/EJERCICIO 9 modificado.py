from typing import List
from datetime import datetime

class Carrera:  
    def __init__(self, nombre):  
        self.nombre = nombre
        self.c_alumnos: List[Alumno] = []
    
    def listar_egresados(self) -> int:
        cant_egresados = contar_egresados(self.c_alumnos)
        iter_alumnos = iter(self.c_alumnos)
        alumno = next(iter_alumnos, None)
        while alumno is not None:
            f_egreso = alumno.ver_fecha_egreso()
            if f_egreso is not None:  
                promedio = alumno.ver_promedio()
                print(f"Egresado {alumno.ver_nombre()} - Promedio: {promedio:.2f}")  
            alumno = next(iter_alumnos, None)
        return cant_egresados
    
def contar_egresados(alumnos) -> int:
    cant_egresados = 0
    iter_alumnos = iter(alumnos)
    alumno = next(iter_alumnos, None)
    while alumno is not None:
        f_egreso = alumno.ver_fecha_egreso()
        if f_egreso is not None:
            cant_egresados += 1
        alumno = next(iter_alumnos, None)
    return cant_egresados

def calcular_promedio(alumno) -> float:
    acumula_notas = 0
    cant_examenes_aprobados = 0
    for examen in alumno.ver_examenes():  
        if examen.ver_nota() >= 6: 
            acumula_notas += examen.ver_nota() 
            cant_examenes_aprobados += 1
    promedio = acumula_notas / cant_examenes_aprobados
    return promedio
       

class Examen:
    def __init__(self, nota: float, fecha: datetime): #Falta el atributo fecha como indica el diagrama UML
        self.nota = nota
        self.fecha = fecha
    def ver_nota(self):
        return self.nota


class Alumno:
    def __init__(self, nombre: str, fecha_ingreso: datetime, fecha_egreso: datetime, examenes: List['Examen']):  #Falta el atributo fecha_ingreso como indica el diagrama UML
        self.nombre = nombre
        self.fecha_egreso = fecha_egreso
        self.examenes = examenes
    def ver_fecha_egreso(self):
        return self.fecha_egreso
    def ver_examenes(self):
        return self.examenes
    def ver_nombre(self):
        return self.nombre
    def ver_promedio(self):
        promedio = 0
        if self.fecha_egreso is not None:
            promedio = calcular_promedio(self)
        return promedio


# Ejemplo de uso
if __name__ == "__main__":
    alumno1 = Alumno("Juan",datetime(2022, 3, 10), None, [Examen(7, datetime(2021, 5, 10)), Examen(8, datetime(2021, 7, 10)), Examen(5, datetime(2021, 8, 10))])
    alumno2 = Alumno("María",datetime(2022, 3, 10), None, [Examen(6, datetime(2021, 7, 10)), Examen(7, datetime(2021, 5, 10)), Examen(6, datetime(2021, 8, 10))])
    alumno3 = Alumno("Andy",datetime(2021, 2, 11), datetime(2025, 4, 15), [Examen(8, datetime(2021, 5, 10)), Examen(10, datetime(2021, 7, 10)), Examen(9, datetime(2021, 8, 10))])
    alumno4 = Alumno("Luca",datetime(2021, 2, 11), datetime(2025, 4, 14), [Examen(8, datetime(2021, 7, 10)), Examen(9, datetime(2021, 5, 10)), Examen(7, datetime(2021, 8, 10))])
    alumno5 = Alumno("Pedro",datetime(2021, 2, 11), datetime(2025, 4, 11), [Examen(8, datetime(2021, 5, 10)), Examen(9, datetime(2021, 8, 10)), Examen(9, datetime(2021, 7, 10))])
    carrera = Carrera("Ingenieria Informatica")
    carrera.c_alumnos = [alumno1, alumno2, alumno3, alumno4, alumno5]
    carrera.listar_egresados()
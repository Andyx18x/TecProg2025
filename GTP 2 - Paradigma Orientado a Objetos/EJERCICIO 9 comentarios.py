from typing import List
from datetime import datetime

class Carrera:  #No cumple el Principio de Responsabilidad Unica (SRP), el metodo listar_egresados hace demasiadas cosas (cuenta egresados, calcula promedios, muestra resultados por pantalla)
    def __init__(self):  #Falta el atributo nombre como muestra el diagrama UML
        self.c_alumnos: List[Alumno] = []
    
    #si se quiere cambiar la logica de promedio hay que modificar listar_egresados y por lo tanto la clase Carrera
    #Es mejor encapsular la lógica de promedio dentro de Alumno, así Carrera no se modifica ante cambios.
    def listar_egresados(self) -> int:  
        cant_egresados = 0
       
        iter_alumnos = iter(self.c_alumnos)
        alumno = next(iter_alumnos, None)
        while alumno is not None:
            f_egreso = alumno.fecha_egreso  #se esta accediendo a un atributo (fecha_egreso) de la clase Alumno (no se cumple principio de ocultacion)
            if f_egreso is not None:
                cant_egresados += 1
                
                acumula_notas = 0
                cant_examenes_aprobados = 0
                for examen in alumno.examenes:  #la clase Carrera esta accediendo al atributo privado examenes de la clase Alumno (No se cumple el principio de ocultacion)
                    if examen.nota >= 6: #se esta accediendo a un atributo (nota) de la clase examen (no se cumple principio de ocultacion)
                        acumula_notas += examen.nota #idem linea anterior
                        cant_examenes_aprobados += 1
                promedio = acumula_notas / cant_examenes_aprobados 
                print(f"Egresado {alumno.nombre} - Promedio: {promedio:.2f}")  #se esta accediendo a un atributo (nombre) de la clase Alumno (no se cumple principio de ocultacion)
            alumno = next(iter_alumnos, None)
        return cant_egresados
    

class Examen:
    def __init__(self, nota: float): #Falta el atributo fecha como indica el diagrama UML
        self.nota = nota


class Alumno:
    def __init__(self, nombre: str, fecha_egreso: datetime, examenes: List['Examen']):  #Falta el atributo fecha_ingreso como indica el diagrama UML
        self.nombre = nombre
        self.fecha_egreso = fecha_egreso
        self.examenes = examenes


# Ejemplo de uso
if __name__ == "__main__":
    alumno1 = Alumno("Juan", None, [Examen(7), Examen(8), Examen(5)])
    alumno2 = Alumno("María", None, [Examen(6), Examen(7), Examen(6)])
    alumno3 = Alumno("Andy", datetime(2025, 4, 15), [Examen(8), Examen(10), Examen(9)])
    alumno4 = Alumno("Luca", datetime(2025, 4, 14), [Examen(8), Examen(9), Examen(7)])
    carrera = Carrera()
    carrera.c_alumnos = [alumno1, alumno2, alumno3, alumno4]
    carrera.listar_egresados()

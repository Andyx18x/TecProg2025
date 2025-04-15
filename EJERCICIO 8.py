from abc import ABC, abstractmethod

class Empresa:
    def __init__(self, nombre):
        self.nombre = nombre
        self.empleados = []
    def agregar_empleado(self, empleado):
        self.empleados.append(empleado)
    def ver_lista_empleados(self):
        return self.empleados


class Empleado(ABC):
    def __init__(self, nombre, apellido, direccion, dni):
        self.nombre = nombre
        self.apellido = apellido
        self.direccion = direccion
        self.dni = dni
    @abstractmethod
    def ver_dni(self):
        pass
    def ver_nombre(self):
        pass
    def ver_apellido(self):
        pass
    def ver_salario(self, periodo):
        pass

def salario_mensualizados(cat):
    if(cat == "supervisor"):
        return 1500000
    if(cat == "contador"):
        return 2100000
    if(cat == "secretario"):
        return 1900000

class Mensualizado(Empleado):
    def __init__(self, nombre, apellido, direccion, dni, categoria, jefe):
        super().__init__(nombre, apellido, direccion, dni)
        self.categoria = categoria
        self.jefe = jefe
    def ver_dni(self):
        return self.dni
    def ver_nombre(self):
        return self.nombre
    def ver_apellido(self):
        return self.apellido
    def ver_jefe(self):
        return self.jefe
    def ver_categoria(self):
        return self.categoria
    def ver_salario(self, periodo):
        print(f"El salario de {self.nombre} {self.apellido} es: ${periodo*salario_mensualizados(self.categoria)}")
    
def salario_jornalizados(horas, preciohorasextras):
    if (horas <= 40):
        salario = horas*15000
    if (horas > 40):
        hor_extras = horas - 40
        salario = 40*15000 + hor_extras*preciohorasextras
    return salario  

class Jornalizado(Empleado):
    def __init__(self, nombre, apellido, direccion, dni, horas, precio_horas_extras, jefe):
        super().__init__(nombre, apellido, direccion, dni)
        self.horas = horas
        self.precio_horas_extras = precio_horas_extras
        self.jefe = jefe
    def ver_dni(self):
        return self.dni
    def ver_nombre(self):
        return self.nombre
    def ver_apellido(self):
        return self.apellido
    def ver_jefe(self):
        return self.jefe
    def ver_salario(self, periodo):
        print(f"El salario de {self.nombre} {self.apellido} es: ${periodo*salario_jornalizados(self.horas,self.precio_horas_extras)}")

class Jefe(Empleado):
    def __init__(self, nombre, apellido, direccion, dni, salario):
        super().__init__(nombre, apellido, direccion, dni)
        self.salario = salario
    def ver_dni(self):
        return self.dni
    def ver_nombre(self):
        return self.nombre
    def ver_apellido(self):
        return self.apellido
    def ver_salario(self, periodo):
        print(f"El salario de {self.nombre} {self.apellido} es: ${periodo*self.salario}")

def listar_empleados_por_jefe(o_jefe: Jefe):
    print(f"Jefe: {o_jefe.ver_nombre()} {o_jefe.ver_apellido()}")
    print("Empleados a su cargo:")
    empleados_encontrados = False
    for empleado in mi_empresa.ver_lista_empleados():
        if isinstance(empleado, Mensualizado) and empleado.ver_jefe() == o_jefe:
            print(f"{empleado.ver_nombre()} {empleado.ver_apellido()} Mensualizado {empleado.ver_categoria()}")
            empleados_encontrados = True
        if isinstance(empleado, Jornalizado) and empleado.ver_jefe() == o_jefe:
            print(f"{empleado.ver_nombre()} {empleado.ver_apellido()} Jornalizado")
            empleados_encontrados = True
    if not empleados_encontrados:
        print("No tiene empleados a cargo")

mi_empresa = Empresa("Nike")
jefe1 = Jefe("Andy","Bonetti","San Jose 2023",45214974,4600000)
jefe2 = Jefe("Luca","Bortolotto","Santos Viani 1331",45990122,4100000)
mi_empresa.agregar_empleado(jefe1)
mi_empresa.agregar_empleado(jefe2)
mensualizado1 = Mensualizado("Juan","Gutierrez","Gobernador Crespo 2889",23455878,"contador",jefe1)
mensualizado2 = Mensualizado("Pedro","Picapiedra","25 de mayo 1450",21667098,"secretario",jefe2)
mensualizado3 = Mensualizado("Martin","Guzman","1 de mayo 2121",25777454,"supervisor",jefe2)
mi_empresa.agregar_empleado(mensualizado1)
mi_empresa.agregar_empleado(mensualizado2)
mi_empresa.agregar_empleado(mensualizado3)
jornalizado1 = Jornalizado("Ricardo","Centurion","9 de julio 1278",32987120,50,17000,jefe1)
jornalizado2 = Jornalizado("Javier","Milei","san martin 2854",36987120,39,18000,jefe1)
mi_empresa.agregar_empleado(jornalizado1)
mi_empresa.agregar_empleado(jornalizado2)

dnijefe = int(input("Ingrese DNI del jefe: "))
jefe_encontrado = False
for empleado in mi_empresa.ver_lista_empleados():
    if (empleado.ver_dni() == dnijefe):
        listar_empleados_por_jefe(empleado)
        jefe_encontrado = True
        break
if not jefe_encontrado:
    print("No se econtro un jefe con ese DNI")


dni = int(input("Ver salario del empleado con dni: "))
meses = int(input("En el periodo (cantidad de meses): "))
encontrado = False
for empleado in mi_empresa.ver_lista_empleados():
    if (empleado.ver_dni() == dni):
        empleado.ver_salario(meses)
        encontrado = True

if not encontrado:
    print("Empleado no encontrado")

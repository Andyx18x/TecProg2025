class Persona:
    def __init__(self, apellido, nombre, telefono, dni):
        self.apellido = apellido
        self.nombre = nombre
        self.telefono = telefono
        self.dni = dni

class Vehiculo:
    def __init__(self, marca, modelo, patente, precio_venta, kilometraje, estado, duenio_anterior=None):
        self.marca = marca
        self.modelo = modelo
        self.patente = patente
        self.precio_venta = precio_venta
        self.kilometraje = kilometraje
        self.estado = estado  
        self.duenio_anterior = duenio_anterior

class Auto(Vehiculo):
    def __init__(self, marca, modelo, patente, precio_venta, kilometraje, estado, 
                 nac_o_imp, origen=None, impuesto_importacion=0, duenio_anterior=None):
        super().__init__(marca, modelo, patente, precio_venta, kilometraje, estado, duenio_anterior)
        self.nac_o_imp = nac_o_imp  
        self.origen = origen
        self.impuesto_importacion = impuesto_importacion
    def ver_si_es_nac_o_imp(self):
        return self.nac_o_imp
    def ver_estado(self):
        return self.estado
    def ver_duenio_anterior(self):
        return self.duenio_anterior

class Camioneta(Vehiculo):
    pass

class Moto(Vehiculo):
    pass

class Accesorio:
    def __init__(self, nombre, marca, precio):
        self.nombre = nombre
        self.marca = marca
        self.precio = precio

class Venta:
    def __init__(self, producto, monto, fecha, comprador):
        self.producto = producto  
        self.monto = monto
        self.fecha = fecha
        self.comprador = comprador
    def ver_producto(self):
        return self.producto
    def ver_monto(self):
        return self.monto

class Concesionaria:
    def __init__(self, nombre):
        self.nombre = nombre
        self.inventario = []
        self.ventas = []

    def agregar_producto(self, producto):
        self.inventario.append(producto)

    def registrar_venta(self, producto, monto, fecha, comprador):
        venta = Venta(producto, monto, fecha, comprador)
        self.ventas.append(venta)

    def total_autos_nacionales_usados(self):
        total = 0
        for venta in self.ventas:
            v = venta.ver_producto()
            if isinstance(v, Auto): #si v es una instancia de la clase Auto
                if v.ver_si_es_nac_o_imp() == "nacional" and v.ver_estado() == "usado" and v.ver_duenio_anterior() is not None:
                    total += venta.ver_monto()
        return total



escobar = Concesionaria("Escobar")
andy = Persona("Bonetti", "Andy", "3496547079", "45214974")
luca = Persona("Bortolotto", "Luca", "3496348091","45990434")


auto1 = Auto("Fiat", 2020, "ABC123", 20000000, 30000, "usado", "nacional", "Argentina", 0, andy)
auto2 = Auto("Honda", 2025, "AH001HE", 25000000, 0, "nuevo", "nacional", "Argentina", 0, None)
auto3 = Auto("Toyota", 2021, "AE120JE", 2100000, 31000, "usado", "nacional", "Argentina", 0, luca)


escobar.agregar_producto(auto1)
escobar.agregar_producto(auto2)
escobar.agregar_producto(auto3)


escobar.registrar_venta(auto1, 19800000, "2025-03-11", luca)
escobar.registrar_venta(auto2, 25000000, "2025-04-14", andy)
escobar.registrar_venta(auto3, 21000000, "2025-04-14", andy)


print("Total de ventas (autos nacionales usados con dueño):", escobar.total_autos_nacionales_usados())

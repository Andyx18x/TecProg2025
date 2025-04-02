import  datetime

class Empresa: 
    def __init__(self, nombre):
        self.nombre_empresa = nombre
        self.facturas = []

    def agregar_factura(self,factura):
        self.facturas.append(factura)

    def mostrar_facturas(self):
        monto_total = 0

        print(f'Nombre de la empresa: "{self.nombre_empresa}" - IVA Monotributo.')
        print('----------------------------------------')
        for factura in self.facturas:
            monto_total += factura.calcular_total()
            factura.mostrar_factura()
            print('----------------------------------------')

        print(f'El monto total generado por todas las facturas es de: ${monto_total}')


class Cliente: 
    def __init__(self, nombre, cuit):
        self.nombre = nombre
        self.cuit = cuit

    def mostrar_nombre(self)->str:
        return self.nombre

    def mostrar_cuit(self)->str:
        return self.cuit


class Factura:
    def __init__ (self, cliente, detalle_factura, fecha, nro_factura):
        self.cliente = cliente
        self.detalle_factura = [detalle_factura]
        self.fecha_factura = fecha.date()
        self.nro_factura = nro_factura

    def agregar_detalle(self, detalle):
        self.detalle_factura.append(detalle)

    def calcular_total(self)->float:
        total=0
        for detalle in self.detalle_factura:
            total+=detalle.calcular_monto()
        return total
    
    def mostrar_factura(self)->None:
        print(f'Factura numero: {self.nro_factura}')
        print(f'Cliente: {self.cliente.mostrar_nombre()} - R.I. - Cuit: {self.cliente.mostrar_cuit()}')
        print(f'Fecha: {self.fecha_factura}')
        print(f'Total: ${self.calcular_total()}')

        count = 1
        for detalle in self.detalle_factura:
            print(f'Detalle {count}: {detalle.mostrar_datos()}')
            count+=1


class Producto:
    def __init__(self, nombre,precio):
        self.nombre = nombre
        self.precio = precio

    def obtener_precio(self)->float:
        return self.precio
    
    def obtener_nombre(self)->str:
        return self.nombre


class DetalleFactura:
    def __init__(self, producto, cantidad):
        self.producto = producto
        self.cantidad = cantidad

    def calcular_monto(self)->float:
        return (self.producto.obtener_precio()*self.cantidad)

    def mostrar_datos(self):
        return f'{self.producto.obtener_nombre()} {self.cantidad}unid. Total item: ${self.calcular_monto()}.-'

    
if (__name__=="__main__"):
    # FACTURA 1
    mi_empresa = Empresa('Mayorista SA')
    cliente1 = Cliente('Electronica SRL','30-45337405-0')

    producto1 = Producto('Televisor 50 pulgadas', 900)
    producto2 = Producto('Macbook Pro 13p M3', 2100) 

    detalle1 = DetalleFactura(producto1,5)
    detalle2 = DetalleFactura(producto2,3)

    factura1 = Factura(cliente1,detalle1,datetime.datetime.now(),'0001 0100')
    factura1.agregar_detalle(detalle2)

    mi_empresa.agregar_factura(factura1)

    # FACTURA 2

    cliente2 = Cliente('Corralon Blas Parera','35-20189467-0')

    producto3 = Producto('Porcelanato 45x45',100)
    producto4 = Producto('Griferia FV 6 piezas',400)

    detalle3 = DetalleFactura(producto3,100)
    detalle4 = DetalleFactura(producto4,1)
    
    factura2 = Factura(cliente2,detalle3,datetime.datetime.now(),'0002 0100')
    factura2.agregar_detalle(detalle4)

    mi_empresa.agregar_factura(factura2)

    mi_empresa.mostrar_facturas()
     
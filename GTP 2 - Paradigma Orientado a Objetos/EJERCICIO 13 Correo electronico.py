#Notificador no debe depender de correo electronico, ya que no se podria notificar 
#mediante ningun otro medio, como sms, etc. 
#Hacer una interfaz 

class CorreoElectronico:
    def enviar_notificacion(self, destinatario: str, mensaje: str):
        # Lógica para enviar notificación por correo electrónico
        print(f"Correo electrónico enviado a {destinatario}: {mensaje}")

class Notificador:
    def __init__(self, correo_electronico: CorreoElectronico):
        self.correo_electronico = correo_electronico
    def enviar_notificacion(self, destinatario: str, mensaje: str):
        self.correo_electronico.enviar_notificacion(destinatario, mensaje)

# Uso del código actual
correo_electronico = CorreoElectronico()
notificador = Notificador(correo_electronico)
notificador.enviar_notificacion("usuario@example.com", "¡Tu tarea está lista!")

#Codigo modificado:
from abc import ABC, abstractmethod

class Notificador(ABC):
    @abstractmethod
    def enviar(self, destinatario: str, mensaje: str):
        pass

class NotificadorEmail(Notificador):
    def enviar(self, destinatario: str, mensaje: str):
        # Lógica para enviar notificación por correo electrónico
        print(f"Correo electrónico enviado a {destinatario}: {mensaje}")

class NotificadorSMS(Notificador):
    def enviar(self, destinatario: str, mensaje: str):
        # Lógica para enviar notificación por SMS
        print(f"SMS enviado a {destinatario}: {mensaje}")

class ServicioNotificacion:
    def __init__(self, notificador: Notificador):
        self.notificador = notificador
    def notificar(self, destinatario: str, mensaje: str):
        self.notificador.enviar(destinatario, mensaje)


servicio = ServicioNotificacion(NotificadorEmail())
servicio.notificar("andyeliasbonetti@gmail.com", "Buenas noches")

servicio2 = ServicioNotificacion(NotificadorSMS())
servicio2.notificar("3496547079", "Buenas tardes")


class NaveCarga {
	var property carga
	var velocidad
	
	method velocidad() {
		return velocidad
	}
	
	method propulsar () {
		if(velocidad <=280000) {
			velocidad += 20000
		}
	}
	method estaSobrecargada() {
		return ((carga > 100000)and(self.estaExcedidaVelocidad()))
	}
	
	method estaExcedidaVelocidad() {
		return velocidad > 100000
	}
	
	method reciboAmenaza(){
		self.carga(0)
	}
}

class NavePasajero {
	var velocidad
	var velocidadMaxima
	const personal = 4
	var personas
	var pasajeros = 0
	var alarma = false
	
	method propulsar () {
		if(velocidad <=280000) {
			velocidad += 20000
		} else {
			velocidad = 300000
		}
	}
	
	method totalPasajeros() {
		pasajeros = personas + personal
		return pasajeros
	}
	method reciboAmenaza() {
		alarma = true
	}
	//Y saber si la nave está en peligro, que sucede cuando
	//va más rápido que su velocidad máxima legal o la alarma
	//en caso de emergencia está encendida. Interpreto que en
	//peligro y la alarma es lo mismo
	method alarmaEncendida() {
		return alarma
	}
	
	method velocidad() {
		return velocidad
	}
	method velocidadMaxima() {
		velocidadMaxima = 300000 / pasajeros
		if(pasajeros > 100) {
			return velocidadMaxima - 200
		} else return velocidadMaxima
	}
	method vaRapido(){
		return velocidad > velocidadMaxima
	}
}

class NaveCombate {
	var velocidad
	var modo
	var armasDesplegadas
	
	method propulsar () {
		if(velocidad <=280000) {
			velocidad += 20000
		}
	}
	
	method despliegoArmas() {
		armasDesplegadas = true
	}
	method guardoArmas() {
		armasDesplegadas = false
	}
	method armasDesplegadas() {
		return armasDesplegadas
	}
	
	method modo(tipo) {
		modo = tipo
	}
	
	method esInvisible() {
		return ((modo == "reposo" and velocidad < 10000) or 
				(modo == "ataque" and !armasDesplegadas))
		
	}
	method reciboAmenaza() {
		if(modo == "reposo"){
			return "¡retirada!"
		}else {
			self.despliegoArmas()
			return "Enemigo Detectado"
		}
	}
	
}

import personaje.*

object armarConspiracion{
	method armar(unObjetivo,conspirados){
		if(unObjetivo.esPeligroso()){
			const unaConspiracion = new Conspiracion(complotados = conspirados ,objetivo = unObjetivo)
		}else{
			self.error("El objetivo no es peligroso, no se concreta la conspiracion")
		}
	}
}

class Conspiracion {
	var complotados = []
	const objetivo
	
	method cantidadDeTraidores(){
		const listaTraidores = complotados.filter({complotado => complotado.esAliadoDe(objetivo)})
		return listaTraidores.size()
	}
	
	method conspirar(){
		complotados.forEach({complotado => complotado.realizarAccion(objetivo)})
	}
	
	method cumplioMision() = not(objetivo.esPeligroso())
	
}

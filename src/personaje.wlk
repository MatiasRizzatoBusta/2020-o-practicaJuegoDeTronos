import familias.*
import animales.*

class Personaje {
	var nombre
	var familia
	var conyugues
	var acompaniantes = []
	var estaVivo = true
	var personalidad
	
	method cantidadDeConyugues() = conyugues.size()
	
	method conyugues() = conyugues
	
	method nombre() = nombre
	
	method soltero() = conyugues.size() == 0
	
	method agregarAcompaniante(acompaniante) = acompaniantes.add(acompaniante)
	
	method esFamiliar(nombreFamilia) = familia == nombreFamilia // comparo que los objetos sean los mismos
	
	method pedirPermiso(conyugue) = familia.permiteCasamiento(self,conyugue)
	
	method agregarConyugue(conyugue) = conyugues.add(conyugue)
	
	method casarse(conyugue){
		if(self.pedirPermiso(conyugue) and conyugue.pedirPermiso(self)){
			self.agregarConyugue(conyugue)
			conyugue.agregarConyugue(self)
		}else{
			self.error("No permite el casamiento")
		}
	}
	
	method patrimonio() = familia.patrimonio() / familia.cantIntegrantes()
	
	method estaVivo() = estaVivo
	
	method morir(){
		estaVivo = false		
	}
	
	method estaSolo() = acompaniantes.size() == 0
	
	method aliados() = conyugues + acompaniantes + familia.familiaresDe(self)
	
	method esDeFamiliaRica() = familia.esRica()
	
	method dineroTotalAliados() = self.aliados().sum({aliado => aliado.patrimonio()})
	
	method esPeligroso() {
		if(self.estaVivo()){
			return conyugues.all({conyugue => conyugue.esDeFamiliaRica()}) || self.dineroTotalAliados() >= 10000 || self.aliados().any({aliado => aliado.esPeligroso()})
		}else{
			return false	
		}
	}
	
	method realizarAccion(objetivo) = personalidad.accion(objetivo)
	
	method derrocharDinero(cantidadDerrochada) = familia.disminuirPatrimonio(cantidadDerrochada)
	
	method esAliadoDe(persona){
		const listaAliados = self.aliados()
		return listaAliados.any({aliado => aliado.esEl(persona)})
	}
	
	method esEl(persona) = nombre == persona.nombre()
	
}


//PERSONALIDADES

object sutil{
	var listaCasas = [lannister,stark,guardiaDeLaNoche]
	
	method agregarCasa(casa) = listaCasas.add(casa)
	
	method buscoCasaPobre() = listaCasas.min({casa =>casa.patrimonio()})
	
	method accion(objetivo){
		const casaPobre = listaCasas.min({casa => casa.patrimonio()})
		if(casaPobre.miembrosSolteros().size() > 1){
			const conyugue = casaPobre.miembrosSolteros().head()
			objetivo.casarse(conyugue)
		}else{
			self.error("no se puede casar")
		}
	}
}

object asesino{
	
	method accion(objetivo){
		objetivo.morir()
	}
}

object asesinoPrecavido{
	
	method accion(objetivo){
		if(objetivo.estaSolo()){
			objetivo.morir()
		}else{
			self.error("No lo puede asesinar")
		}
	}
}

object disipado{ //como el dinero derrochado es la misma para todos los disipados no lo hago clase
	
	method accion(objetivo){
		objetivo.derrocharDinero(800)
	}
}

object miedoso{
	
	method accion(objetivo){}
}

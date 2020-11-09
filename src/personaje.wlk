import familias.*
import animales.*

class Personaje {
	var familia
	var conyugues = []
	var acompaniantes = []
	
	method cantidadDeConyugues() = conyugues.size()
	
	method conyugues() = conyugues
	
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
	
	method estaVivo() = true
	
	method estaSolo() = acompaniantes.size() == 0
	
	method aliados(){
		const listado = conyugues
		familia.miembros().forEach({miembro => listado.add(miembro)})
		acompaniantes.forEach({acompaniante => listado.add(acompaniante)})
		return listado
		
	}
	
	method esDeFamiliaRica() = familia.esRica()
	
	method dineroTotalAliados() = self.aliados().sum({aliado => aliado.patrimonio()})
	
	method esPeligroso() {
		if(self.estaVivo()){
			return conyugues.all({conyugue => conyugue.esDeFamiliaRica()}) || self.dineroTotalAliados() >= 10000 || self.aliados().any({aliado => aliado.esPeligroso()})
		}else{
			return false	
		}
	}
	
	
	
}
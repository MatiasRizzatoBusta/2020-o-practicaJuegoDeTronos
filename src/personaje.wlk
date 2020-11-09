import familias.*

class Personaje {
	var familia
	var conyugues = []
	var acompaniantes = []
	
	method cantidadDeConyugues() = conyugues.size()
	
	method conyugues() = conyugues
	
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
	
}
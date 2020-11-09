import personaje.*

class Familia {
	var patrimonio = 0
	var ciudadProveniente
	var miembros = []
		
	method permiteCasamiento(familiar,conyugue)
	
	method miembros() = miembros
	
	method patrimonio() = patrimonio
	
	method agregarPatrimonio(patrimonioNuevo){
		patrimonio += patrimonioNuevo
	}
	
	method agregarMiembro(integrante) = miembros.add(integrante)
	
	method esRica() = patrimonio > 1000
	
	method cantIntegrantes() = miembros.size()
	
}

object lannister inherits Familia{
	
	override method permiteCasamiento(familiar,conyugue) = not(familiar.cantidadDeConyugues() >=1)

}


object stark inherits Familia{
	
	override method permiteCasamiento(familiar,conyugue) = not(conyugue.esFamiliar(self))
}

object guardiaDeLaNoche inherits Familia{
	
	override method permiteCasamiento(familiar,conyugue) = false
}
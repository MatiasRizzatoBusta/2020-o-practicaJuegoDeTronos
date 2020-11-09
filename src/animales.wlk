import personaje.*

class Animal{
	method patrimonio() = 0
	
	method esPeligroso() 
}

class Dragon inherits Animal{
		
	override method esPeligroso() = true
	
}

class Lobo inherits Animal{
	var raza = comun
	
	override method esPeligroso() = raza.esHungaro()
	
}

// RAZAS LOBOS

object comun{
	
	method esHungaro() = false
}

object hungaro{
	
	method esHungaro() = true
}
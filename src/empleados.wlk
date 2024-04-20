object galvan {

	var sueldo = 150000
	var deuda = 0
	var dineroDisponible = 0

	method actualizarSueldo(nuevoValor) {
		sueldo = nuevoValor
	}

	method sueldo() = sueldo

	method gastar(cuanto) = if (dineroDisponible >= cuanto) self.descontarDeDineroDisponible(cuanto) else self.generarDeuda(cuanto)

	method totalDeuda() = deuda

	method totalDinero() = dineroDisponible

	method descontarDeDineroDisponible(cuanto) {
		dineroDisponible -= cuanto
	}

	method generarDeuda(cuanto) {
		deuda += (cuanto - dineroDisponible)
		dineroDisponible = 0
	}

	method cobrarSueldo() {
		dineroDisponible = 0.max(self.sueldo() - deuda)
		deuda = 0.max(deuda - self.sueldo())
	}

	method saldarDeuda() {
	}

}

object baigorria {

	var empanadasVendidas = 0
	var sueldoAcumulado = 0

	method empanadasVendidas(cantidad) {
		empanadasVendidas = cantidad
	}

	method sueldo() = empanadasVendidas * 150

	method cobrarSueldo() {
		sueldoAcumulado += self.sueldo()
	}

	method totalCobrado() = sueldoAcumulado

}

//dueño del local
object gimenez {

	var fondoParaSueldos = 3000000

	method pagarSueldo(empleado) {
		fondoParaSueldos = fondoParaSueldos - empleado.sueldo()
		empleado.cobrarSueldo()
	}

	method fondoDisponible() = fondoParaSueldos

}


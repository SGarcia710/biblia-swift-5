import UIKit

/* Optional Chaining */
// Recordar que opcional no significa que el valor sea opcional sino que puede ser nulo.


class Person {
    var residence: Residence?
}


class Residence{
    var numberOfRooms = 1
}


let edgar = Person()
// let roomCount = edgar.residence!.numberOfRooms // Usar Force unwrapping es rápido y práctico para debuggear, pero no se debe hacer

if let roomCount = edgar.residence?.numberOfRooms { // Esto se lee así: Si yo puedo consultar la residencia de Edgar, y de ahí ver el número de habitaciones
    print("La casa de Edgar tiene \(roomCount) habitación(es).")
} else {
    print("Edgar no tiene casa.")
}

edgar.residence = Residence()

if let roomCount = edgar.residence?.numberOfRooms {
    print("La casa de Edgar tiene \(roomCount) habitación(es).")
} else {
    print("Edgar no tiene casa.")
}

// El optional chaining es una de las features favoritas de la comunidad en Swift

class Persona {
    var residencia: Residencia?
}

class Residencia {
    var habitaciones = [Habitacion]()
    var cantidadDeHabitaciones: Int {
        habitaciones.count
    }
    subscript(i: Int) -> Habitacion {
        get {
            return habitaciones[i]
        }
        set {
            habitaciones[i]
        }
    }
    var direccion: Direccion?
    
    func imprimirCantidadHabitaciones() {
        print("El numero de habitaciones \(self.cantidadDeHabitaciones)")
    }
}

class Habitacion {
    let nombre: String
    init(nombre: String) {
        self.nombre = nombre
    }
}

class Direccion {
    var nombreEdificio: String?
    var numEdificio: String?
    var calle: String?
    
    func identificadorDeEdificio() -> String? {
        if let numEdificio = self.numEdificio, let calle = self.calle {
            return "\(numEdificio), \(calle)"
        } else if self.nombreEdificio != nil {
            return self.nombreEdificio
        } else {
            return nil
        }
    }
}

let sebastian = Persona()

if let roomCount = sebastian.residencia?.cantidadDeHabitaciones {
    print("La casa de Sebastian tiene \(roomCount) habitación(es).")
} else {
    print("Sebastian no tiene casa.")
}

func crearDireccion() -> Direccion {
    let unaDireccion = Direccion()
    unaDireccion.numEdificio = "13"
    unaDireccion.calle = "Calle de Platzi"
    
    return unaDireccion
}


sebastian.residencia?.direccion = crearDireccion() // Si la resiencia no existe, no continua, así que nunca lega a suceder la asignación.
sebastian

sebastian.residencia?.imprimirCantidadHabitaciones()

if sebastian.residencia?.imprimirCantidadHabitaciones() != nil { // Si logro ejecutar la función del objeto residencia
    print("He podido obtener el número de habitaciones de la casa de Sebastián")
} else { // Si la residencia no existe
    print("No he podido obtener el número de habitaciones de la casa de Sebastián")
}

if (sebastian.residencia?.direccion = crearDireccion()) != nil { // Si logro llevar acabo la asignación de la dirección de la residencia
    print("Ha sido posible configurar la dirección de Sebastián")
} else { // Si la residencia no existe
    print("No ha sido posible configurar la dirección de Sebastián")
}

if let nombrePrimeraHabitacion = sebastian.residencia?[0].nombre { // Como la residencia de sebatián sigue sin ser asignada, este safe wrapping con optional chaining se irá al else
    print("La primer habitación es \(nombrePrimeraHabitacion)")
} else {
    print("La primera habitación es inaccesible")
}

sebastian.residencia?[0] = Habitacion(nombre: "Baño") // Es nulo porque la residencia sigue sin existir en el objeto sebastian

let casaDeSebastian = Residencia()
casaDeSebastian.habitaciones.append(Habitacion(nombre: "Baño"))
casaDeSebastian.habitaciones.append(Habitacion(nombre: "Cocina"))
casaDeSebastian.habitaciones.append(Habitacion(nombre: "Sala"))

sebastian.residencia = casaDeSebastian

if let nombrePrimeraHabitacion = sebastian.residencia?[0].nombre { // Ahora que sebastian ya tiene una residencia, y esa residencia ya tiene habitaciones, se va por el si del if
    print("La primer habitación es \(nombrePrimeraHabitacion)")
} else {
    print("La primera habitación es inaccesible")
}

// En qué calle vive sebastián
sebastian.residencia?.direccion = crearDireccion()

if let calleDeSebastian = sebastian.residencia?.direccion?.calle {
    print("La casa de Sebastián está en la calle \(calleDeSebastian)")
} else {
    print("No sé donde vive Sebastián")
}
sebastian

if let identificadorEdificio = sebastian.residencia?.direccion?.identificadorDeEdificio() { // Si de sebastian, la residencia no es nil y la direccion no es nil
    print("Sebastián vive en \(identificadorEdificio)")
} else {
    print("No se sabe donde vive Sebastián")
}

if let _ = sebastian.residencia?.direccion?.identificadorDeEdificio()?.hasPrefix("13") { // Si la residencia no es nil, la direccion no es nil, el identificador del edificio no es nil y este ultimo inicia por 13
    print("Sebastián vive en el número 13")
    
} else {
    print("Sebastián no vive en el número 13")
}
 

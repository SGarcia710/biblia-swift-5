import UIKit

/* Enumerados o clases vagas (Enumerations): a diferencia de una clase que tiene propiedades, metodos, etc... Un enumerado simplemente tiene un valor posible dentro de un conjunto disponible. */

enum SomeEnumerations {
    // Aquí iría la definición del enumerado
}

enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToGo = CompassPoint.north
directionToGo = .south // Al querer cambiar el valor, Swift ya obvia que es de tipo CompassPoint

switch directionToGo {
    case .north:
        print("Debes ir al norte")
    case .south:
        print("Hay pingüinos en el sur")
    case .east:
        print("Mordor se extiende hacia las tierras del este")
    case .west:
        print("Cuidado con los vaqueros")
}

let somePlanet = Planet.earth
switch somePlanet {
    case .earth:
        print("La tierra es segura")
    default:
        print("No es seguro ir a este planeta")
}

// Iterar sobre cases de un enum: se le da el tipo CaseIterable que  es un protocolo, lo cual es un tipo de programa que sirve para delegar funcionalidades sin tener que programarlas. En este caso, se le delega la propiedad de ser capaz de contar cuantos casos posibles hay dentro de todas las bebidas e incluso poder hacer ciclos con estos
enum Beverage: CaseIterable {
    case coffe, redbull, cocacola, juice, tea
}
let numberOfChoices = Beverage.allCases.count
for beverage in Beverage.allCases {
    print(beverage)
}


/* Enumerations, \"códigos de barras\" */
enum Barcode {
    case upc (Int, Int, Int, Int)// Productos etiquetados con códigos de 4 números
    case qrCode (String)
}

var productBarcode = Barcode.upc(12920, 41388, 91210, 3)
productBarcode = .qrCode("ASDJKL")

switch productBarcode {
case .upc(let numberSystem, let manufacter, let product, let check):
    print(numberSystem, manufacter, product, check)
case .qrCode(let code):
    print(code)
default:
    break;
}

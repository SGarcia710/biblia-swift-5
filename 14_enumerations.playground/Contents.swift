import UIKit

/* Enumerados o clases vagas (Enumerations): a diferencia de una clase que tiene propiedades, metodos, etc... Un enumerado simplemente tiene un valor posible dentro de un conjunto disponible. */

enum SomeEnumerations { // Si no le declaro un tipo a un enum, solo tendrán Hash Values sus cases.
    // Aquí iría la definición del enumerado
}
// Si solo se necesita el enumerado a modo de bifurcar caminos o generar estructuras de control, no es necesario darle un raw value.

// Si en algún punto de mi aplicación, el usuario ingresa un valor y a partir de ahí se desea elegir un enumerado, lo mejor es asignarle un valor a cada uno (Raw value)
enum CompassPoint: String { // Si le pongo un tipo, este será su Raw Value. Y si no le doy un valor a cada case, tomará por defecto el nombre de los mismos.
    case north
    case south
    case east
    case west
}

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
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
    case let .upc(numberSystem,  manufacter,  product,  check): // Si son muchas variables las que quiero guardar en el case, pongo el let después del case
        print(numberSystem, manufacter, product, check)
    case let .qrCode(code):
        print(code)
}

/* Enumeradores con raw values */
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

enum Familia: Int {
    case father = 1, mother, son, daughter
}

let earthOrder = Planet.earth.rawValue
let northDir = CompassPoint.north.rawValue

let planetPosition = 5
if let possiblePlanet = Planet(rawValue: planetPosition) { // Recordar hacer Safe casting para handlear posibles nil
    print("El planeta es \(possiblePlanet).")
} else {
    print("No existe un planeta con el valor \(planetPosition).")
}

enum Coso {
    case uno
}
Coso.uno.hashValue
print()

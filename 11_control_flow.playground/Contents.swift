import UIKit

/* Ciclo For : Depende de forma explicita de una colección*/

let names = ["Sebastián", "Juan", "Ricardo", "Sara"]

for name in names {
    print(name)
}

let numberOfLegs = ["Spider": 8, "Dog": 4, "Ant": 6]

for (key, value) in numberOfLegs {
    print("The \(key) has \(value) legs.")
}

for idx in 1...10 {
    print("\(idx) * 3 = \(idx * 3)")
}

let power = 10
let base = 2
var answer = 1

for _ in 1...power {
    answer *= base
    print(answer)
}

var hour = 9
let minutes = 60
let minuteInterval = 5

for tickMark in 0..<minutes {
    print("\(hour):\(tickMark)")

}

for tickMark in stride(from: 0, to: minutes, by: minuteInterval) { // Hacer un ciclo for que itere en intervalos diferentes de uno. En este caso de 5 en 5 desde 0 hasta 60.
    print("\(hour):\(tickMark)")
}

/* Ciclo While: Depende de una condición dada */
var i = 0
while i <= 10 {
    print(i)
    i += 1
}

print(i)

repeat { // Do-while en Swift
    i += 1
    print(i)
} while i <= 10

/* Sentencias de Control: If-else */

let temp = 30

if temp <= 15 {
    print("Hace frío! Enciende la calefacción.")
} else if temp >= 25{
    print("Hace calor! Enciende el aire acondicionado")
} else {
    print("La sensaión térmica es agradable. No hace falta modificarla.")
}

/* Sentencias de Control: Switch-case. En Swift el Switch-case es exhaustivo, es decir que una vez que se entra en un caso, ya deja de comprobar los demás; por esto no es necesario usar el Break después de cada sentencia. */
let provider : String = "movistar"

switch provider {
    case "Movistar", "movistar":
        print("Llama al *300")
    case "Claro", "claro":
        print("Llama al *611")
    default:
        print("Tú operador no existe")
}

// Interval Matching

let moons = 62
let phrase = "lunas en saturno"
let naturalCount: String

switch moons {
    case 0:
        naturalCount = "No hay"
    case 1..<5:
        naturalCount = "Hay unas pocas"
    case 5..<12:
        naturalCount = "Hay bastantes"
    case 12..<100:
        naturalCount = "Hay decenas de"
    case 100..<1000:
        naturalCount = "Hay centenas de"
    default:
        naturalCount = "Hay muchísimas lunas en saturno"
}

print("\(naturalCount) \(phrase)")

// Switch-case con tuplas
let somePoint = (1, 1)
switch somePoint {
    case (0, 0):
        print("El punto \(somePoint) es el origen de coordenadas.")
    case (_, 0):
        print("El punto \(somePoint) se halla sobre el eje horizontal (X).")
    case (0, _):
        print("El punto \(somePoint) se halla sobre el eje vertical (Y).")
    case (-2...2, -2...2):
        print("El punto \(somePoint) se halla en el interior del cuadrado de lado 4.")
    default:
        print("El punto \(somePoint) está en algún otro lado.")
}


// Guardar los valores de la tupla
let anotherPoint = (2, 2)

switch anotherPoint {
    case (let x, 0):
        print("Sobre el eje de las X con valor \(x).")
    case (0, let y):
        print("Sobre el eje de las Y con valor \(y).")
    case let (x, y) where x == y:
        print("El punto se halla sobre la recta x = y")
    case let (x, y) where x == -y:
        print("El punto se halla sobre la recta x = -y")
    case let (x, y):
        print("En algún otro lugar del plano, en (\(x),\(y))")
} // Como se puede notar, en este switch-case se consideran todos los casos posibles, de manera que el Default no es necesario. El mismo Swift lo indica al ponerlo.

// Switch con casos compuestos
let someChar: Character = "a"

switch someChar {
    case "a", "e", "i", "o", "u":
        print("\(someChar) es una vocal.")
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
        print("\(someChar) es una consonante.")
    default:
        print("\(someChar) no es un caracter del abecedario.")
}

let stillAnotherPoint = (9,0)

switch stillAnotherPoint {
    case (let distance, 0), (0, let distance):
        print("Se halla sobre el eje, a distancia \(distance) del origen")
    default:
        print("No está sobre el eje")
}

/* Sentencias de transferencias de control (Control Transfer Sentences):
    continue,
    break,
    fallthrough,
    return,
    throw */


// Continue y Break
let sentence = "Las mentes grandes piensa igual."
var newSentence = ""
let charsToRemove: [Character] = ["a", "e", "i", "o", "u"]

for char in sentence {
    if charsToRemove.contains(char) {
        continue
    }
    newSentence.append(char)
    if char == "d" {
        break
    }
}
print(newSentence)

// fallthrough: Pasar hacia delante. Se usa única y exclusivamente con el Switch.
let intToDescribe = 5
var description = "El número \(intToDescribe) es"

switch intToDescribe {
case 2,3,5,7,11,13,17,19:
    description += " un número primo y" // El 5 es primo, así que cae aquí
    fallthrough
default:
    description += " un número entero." // Pero también es entero, pero como el switch se rompe al caer en un caso, debo usar el fallthrough para caer además en el siguiente caso de donde cayó el switch
}
print(description)

// return y guard: Debe estar dentro de una función

var sebas : [String: Any] = ["Name": "Sebastián", "Age": 23, "IsMale": true]

func testUserValidation(person: [String : Any]) {
    guard let surname = person["Surname"] else{ // Si existe el surname y lo puede crear, lo que pasará es que esa variable surname llegará fuera del if
        print("El apellido es desconocido")
        return
    }
    // Aquí existe surname
    print(surname)
    guard let age = person["Age"] else {
        print("La edad es desconocida")
        return
    }
    // Aquí existe age
    print(age)
}

sebas["Surname"] = "García"
testUserValidation(person: sebas)

// Chequear versión de Sistema Operativo
if #available(iOS 12, macOS 10.12, *) {
    // Ejecutar las acciones que solo están disponibles en iOS >12 y macOS >10.12
} else {
    // Mantener el código viejo con versiones anteriores de iOS y macOS
}

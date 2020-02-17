import UIKit

/* Clasificación de operadores:
 - Operadores unarios
 - Operadores binarios
 - Operadores ternarios */


/* Operadores Unarios */
// Operador de asignación ( = )
let b = 10
var a = 5
a = b

let (x, y) = (1, 2)

1 + 2
5 - 3
2 * 3
4 / 2

"Hello" + ", World"

9.0 / 4.0

// Lo que ocurre cuando se hace Dividendo / Divisor es que se obtiene una expresión -> Dividendo == Divisor * Cociente * Resto (Formula o algoritmo de Euclides)
let dividendo = 9
let divisor = 4

let cociente = dividendo / divisor // Cociente
let resto = dividendo % divisor // Resto

// Comprobación
dividendo == divisor * cociente + resto

// Tener en cuenta que cuando es negativo puede ser diferente
-9 % 4 // -9 == -2 * 4 + (-1)

// usar ( - ) como operador unario
let five = 5
let minusFive = -five
let plusFive = -minusFive

// usar ( + ) como operador unario
let minusSix = -6
let alsoMinusSix = +minusSix

var number = 5
number += 3
number -= 2
number *= 2
number /= 4
number %= 2

/* Comparaciones:
 Existen un total de 6 comparaciones básicas que se pueden llevar a acabo que son herencia de las 6 básicas de C*/

1 == 1
1 == 2
1 != 2
1 > 2
1 < 2
2 >= 2
3 <= 4

let name = "Juan Gabriel"

if name == "Juan Gabriel" {
    print("Bienvenido \(name)")
}

(1, "Juan Gabriel") < (2, "Ricardo Celis") // Es verdadero porque 1 es menor que dos y entonces automaticamente ya se cumple la condición
(3, "Juan Gabriel") < (3, "Ricardo Celis") // Es verdadero porque, aunque el 3 no sea menor que 3, al comparar los dos Strings, Juan Gabriel va primero que Ricardo Celis por orden de abecedario
(3, "Ricardo") < (3, "Juan Gabriel") // Es falso porque el 3 no es menor que el 3, y por orden de abecedario Ricardo no va antes que Juan Gabriel

(4, "perro") == (4, "perro") // Comparación elemento a elemento

("perro", false) == ("perro", true) // Los booleanos solo se pueden comparar con Igualdad ( == ) o desigualdad ( != )

/* Operaciones ternarias (único operador que opera sobre 3 elementos
 if question {
    answer1
 } else {
    answer2
 }
 */

let contentHeight = 40
var hasImage = true
var rowHeight = 0

// Tipica comprobación
if hasImage {
    rowHeight = contentHeight + 50
} else {
    rowHeight = contentHeight + 10
}

// Aplicación de operación ternaria
rowHeight = contentHeight + (hasImage ? 50 : 10)

/* Nil Coalescing Operator */
let defaultAge = 18
var userAge: Int?

var ageTobeUsed = userAge ?? defaultAge // Si la edad existe, pues la usa, sino, el operador ( ?? ) indica que se use defaultAge


/* Rangos */

for idx in 1...5 { // Rango cerrado que toma desde el primer valor hasta el ultimo
    print(idx)
}

// Rango semi-abierto ( Por ejemplo se usa en arrays que no se quiere llegar al ultimo número de su tamaño )
for idx in 1..<5 { // que tome todos los valores menos el ultimo
    print(idx)
}

let names = [ "Sebastián", "Jonatan", "Gabriel" ]

for i in 0..<names.count { // Imprime desde la posición 0 hasta la cantidad de items en el arreglo -1
    print(names[i])
}
for name in names { // Imprime todos
    print(name)
}
for name in names[1...] { // Imprime desde el segundo hasta el ultimo
    print(name)
}
for name in names[...1] { // Imprime desde el inicio hasta el segundo
    print(name)
}
for name in names[..<2] { // Imprime desde el primero hasta antes del 2
    print(name)
}

/* Rangos sueltos */
let range = ...5 // desde -infinito hasta el 5
range.contains(7) //  False
range.contains(4) // True
range.contains(-2) // True

/* Operadores Lógicos */
let allowEntry = false
if allowEntry {
    print("Puedo entrar")
}
if !allowEntry {
    print("No puedo entrar")
}

let enterDoorCode = true
let passRetinaScan = false
if enterDoorCode && passRetinaScan {
    print("Puedes entrar")
} else {
    print("No puedes entrar")
}

let hasMoney = true
let hasInvitation = false
if hasMoney || hasInvitation {
    print("Bienvenido a la fiesta")
} else {
    print("No eres bienvenido aquí...")
}

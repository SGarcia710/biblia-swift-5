import UIKit

/* Sintáxis =>
 func nombreFunción(nombreParam: tipoParam, otrosParam...) -> tipoRetorno (Si se tiene retorno) {
        Cuerpo de la función
 }
 */
// Con un solo parametro de entrada y parametro de salida String
func greeting(person: String) -> String {
    let greet = "Hola, \(person)!"
    return greet
}

greeting(person: "Sebastián")
greeting(person: "Ricardo")

// Con varios parametros de entrada y parametro de salida String
func showUserInfo(name: String, surname: String, age: Int) -> String {
    let userInfoPhrase = "El nombre del usuario es \(name) \(surname) y tiene \(age) años."
    return userInfoPhrase
}

showUserInfo(name: "Sebastián", surname: "García", age: 23)


// Sin parametros de entrada y parametro de salida String
func sayHello() -> String{
    let hello = "Hello, World"
    return hello
}

sayHello()

// Con un parametro de entrada y sin parametro de salida
func sayHello2(name: String) {
    print("Hello, \(name)")
}

sayHello2(name: "Natalia")

func sayAndCount(string: String) -> Int {
    print(string)
    return string.count
}

sayAndCount(string: "Hola")
// Usar una función que retorna sin su retorno.
func sayWithoutCount(string: String) {
    let _ = sayAndCount(string: string)
}

sayWithoutCount(string: "Epa")

// Trabajar con tuplas
func minAndMax(array: [Int]) -> (min: Int, max: Int)? { // La tupla de retorno es opcional porque puede darse el caso de que se mande un array vacío
    if array.isEmpty{ return nil } // Compruebo que el array no esté vacío
    
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin{
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}

if let bounds = minAndMax(array: [1,2,3,5,6,21,36,721,1241,2]) {
    print("Los valores se hallan entre \(bounds.min) y \(bounds.max).")
} else {
    print("El array está vacío.")
}

// Usar argumentos para evitar usar la etiqueta de cada parámetro (Alias para las etiquetas)
func someFunction(f1 firstParamName: Int, f2 secondParamName: Int) {
    // Aquí puedo usar firstParamName y secondParamName
}

someFunction(f1: 2, f2: 2) // Así me evito escribir el nombre completo de las etiquetas.

// Evitar poner la etiqueta de un parámetro al llamar una función
func greeting(_ name: String, from hometown: String) -> String {
    return "Hola \(name), un placer que nos visites desde \(hometown)."
}

greeting("Sebastián", from: "Colombia")

// Parámetros con valor por defecto
func multiply(_ n1: Int, _ n2: Int = 1) -> Int {
    return n1 * n2
}
multiply(5, 5)
multiply(5)

// Cantidad de parámetros desconocida (Parámetro variadico(Variadic))
func mean(_ numbers: Double...) -> Double {
    var total : Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

mean(1, 2, 3, 4, 5, 6, 7, 8)
mean(12)
mean(12, 12)
mean(1, 2)
mean(1.2, 3.4, 5.2)

// Parametros de entrada y salida (inout) (Paso de variables por referencia)
var x = 5

func addOne(number: Int) {
    var number2 = number // Tengo que hacer una variable temporal porque el parámetro es CONSTANTE así que no se puede operar sobre el directamente
    number2 += 1
    print("El número ahora vale \(number2)")
}

addOne(number: x)

func swapTwoInts(_ a: inout Int, _ b: inout Int) { // Si quiero operar sobre variables pasadas por parametros, debo usar el inout antes del tipo de dato
    let tempA = a
    a = b
    b = tempA
}

var someInt = 3
var otherInt = 7
print(someInt, otherInt)
swap(&someInt, &otherInt)
print(someInt, otherInt)

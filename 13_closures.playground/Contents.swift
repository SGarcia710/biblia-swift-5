import UIKit

/* Tipos de funciones:
 1: Función Global: Funciones comunes, que pueden o no contener otras funciones
 2: Nested Functions: Internas, permiten acceder a los valores de las Globales que las contienen
 3: Closures: Función que no tiene nombre. Sintáxis ligera
 */

let names = ["Christian", "Freddy", "Sebastián", "Ricardo"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

backward("Juan Gabriel", "Ricardo")

var reversedName = names.sorted(by: backward)

/*
 Sintáxis Closure:
 {
    (params) -> return type in
    // Código del closure
 }
 */

// Dados dos valores de tipo String, retornar un Booleano si la primera variable es mayor que la segunda
reversedName = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 })
// Dados dos valores, retornar si el primero es mayor que el segundo
reversedName = names.sorted(by: { s1, s2 in return s1 > s2 })
// Dados dos valores, ¿ Es mayor el primero que el segundo ?
reversedName = names.sorted(by: { s1, s2 in s1 > s2 })
// ¿Argumento en la posición 0 mayor que el argumento en la posición 1?
reversedName = names.sorted(by: { $0>$1 })
// Ordenar todo por mayor que
reversedName = names.sorted(by: >)

/* Trailing Closures : Función que se escribe después de una función entre parentesis */

func someFunc(closure: () -> Void) {
    // Aquí iría el cuerpo de la función y el uso del closure
}

someFunc(closure: {
    // Aquí iría el cuerpo del closure
})

someFunc { // Trailing closure
    // Aquí iría el closure
}

reversedName = names.sorted{
    $0>$1 // Aquí no serviría poner solo " > " porque en el Trailing Closure se necesita por lo menos los valores a usar
}

let digitNames = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five",
                  6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]

let numbers = [111, 21, 2423]

let numberStrings = numbers.map{ (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number%10]! + output// Aunque no se sepa si existe esta key, el Force Unwrapping aquí está justificado porque un número modulo 10 dará los números del 0 al 9, tal cual se tiene en el digitNames
        number /= 10
    } while number > 0
    return output
}
 
/* Capturing Closures: Capturar los valores que rodean al Closure. Permiten capturar valores que no están dentro del Closure, sino de otra función más genérica que lo engloba. */

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10) // tiene su variable local de runningTotal
incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7) // Tiene su propia variable local de runningTotal
incrementBySeven()

incrementByTen()

/* Escaping Closures: usan el @ los cuales son atributos o modificadores */
var completionHandlers: [() -> Void] = [] // Un metodo que se ejecuta cuando se ha completado una tarea anterior

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) { // Escapo que este closure sea usado ahora y lo dejo para usar después. Así que queda guardado en mi array de completionHandlers
    completionHandlers.append(completionHandler) // Guardo el closure sin ejecutarlo, por eso necesito escapar el closure, para que no se ejecute
}

func someFunctionWithNonEscapingClosure(closure: () -> Void){
    closure() // Este hace uso del closure
}

class SomeClass{
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure {
            self.x = 100 // No puedo escapar un closure sin ser especifico de donde lo guardaré
        }
        someFunctionWithNonEscapingClosure {
            x = 200 // En un closure no escapante, no es necesario ser especifico, porque lo ejecutará ahí mismo y ya sabrá donde encontrar la variable
        }
    }
}

let instance = SomeClass()
instance.x
instance.doSomething() // Al hacer esto, guardo un closure para usar despuès y ejecuto el otro.
instance.x // Así que la X se modifica a 200.

completionHandlers.count // Pero ahora puedo ejecutar el closure que completionHandlers ahora tiene
completionHandlers.first?() // El cual es optional, porque puede no existir.
instance.x // Y x se ve igualado a 100

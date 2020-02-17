import UIKit

// El nulo de los optionals es diferente al null común de otros lenguajes (El cual es un puntero que apunta a un espacio en memoria vacio)
// El Nil en un Optional es ausencia de valor

let possibleAge = "31"
let convertedAge = Int(possibleAge) // Esto es un entero opcional : Int?

let possibleInt = "paco"
let convertedPossibleInt = Int(possibleInt) // Se le llaman optionals(Int?) porque existe la posibilidad de que no sea un Entero lo que se quiera convertir a Int, como el casteo busca un entero, y al hacerlo no lo encuentra, entonces, tirará Nil

// La diferecia entre un Int? y un Int es que el Int? puede dar nil, mientras que el Int debe tener un valor.

// Ejemplo de uso: Si no estoy seguro de que mi variable siempre tendrá un valor, lo ideal es hacer el dato Opcional con el ? después del tipo
var serverResponseCode : Int? = 404 // En un momento dado de mi aplicación puedo tener un código
serverResponseCode = nil // Como también no puedo tenerlo

var surveyAnswer : String? // Por ejemplo en una encuesta, un valor que no es obligatorio responder debe ser optional

/* Force Unwrapping (fuerza bruta) */
if convertedAge != nil {
    // Estar aquí me asegura de que no es nil la variable
    print("La edad del usuario no es nula, es \(convertedAge!)") // Así que por fuerza bruta lo imprimo
} else {
    print("La edad del usuario es nula")
}
// Si quiero forzar un optional, debo hacer la comprobación de que existe, como en el ejemplo anterior


/* Optional Binding */

surveyAnswer = "42"

if let actualAnswer = surveyAnswer {
    // Al llegar aquí, surveyAnswer no es nulo
    print("El String \(surveyAnswer) tiene el valor \(actualAnswer)")
    // Claramente después del optional binding lo que se usaría sería el actualAnswer, porque ya se tiene el valor tipado y usable sin warnings
} else {
    // Aquí el valor es nulo
}

// Esto sería un ejemplo más realista y también encadenando condiciones y más validaciones(binding)
if let firstNumber = Int("4"),
    let secondNumber = Int("42"),
    firstNumber < secondNumber && secondNumber < 100{
    print("El resultado es: \(firstNumber + secondNumber).")
}

/* Unwrapping Implícito */
let possibleString : String? = "Un string optional"
let forcedString : String = possibleString! // Esto no debería hacerse sin force unwrapping

let assumedString : String! = "Un string unwrapped de forma implícita a partir de un optional"
let implicitString : String = assumedString

if assumedString != nil {
    print(assumedString!)
}

if let definitiveString = assumedString {
    print(definitiveString)
}

print(assumedString)

// Finalmente esto nos permite evitar el casting

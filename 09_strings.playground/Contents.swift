import UIKit

// Strings Literales, porque cuando se crean toman un valor determinado

let someString = "Rojo"


let multiLineString = """
    Soy
     Sebastián

    García
"""

let multiLineWithoutLineString = """
Este String aparecerá \
junto a este string
y este abajo
"""

print(multiLineString)
print(multiLineWithoutLineString )

// Escapar caracteres especiales
let specialCaractersString = "\"La imaginación es más importante que el saber\" - Albert Einstein"
print(specialCaractersString )

let dolarSign = "\u{24}"
let blackHeart = "\u{2665}"
let heart = "\u{1F496}"

let flag = "\u{1F1E8}\u{1F1F4}"


// Strings vacios
var emptyString = ""
var anotherEmptyStrin = String()

if emptyString.isEmpty {
    print("Este print está vacio")
}

var newSomeString = "Es un caballo"
newSomeString += " \(someString)"

// Tipo de datos: Por referencia y evaluado(Describe un tipo de dato que contiene el valor en si mismo y cuando se quiere hacer una copia de él, la copia es real, es decir que son espacios en memoria diferentes)

// Evaluados = Strings, booleanos, enteros, floats, doubles
var a = "A"
var b = a
a = "C"
print(a, b)


// Caracteres
let name = "Sebastián🧟‍♂️"
print(name.count)
for char in name {
    print(char)
}

// Tipo Character
let exclamantion : Character = "!"

// Crear string a partir de chars
let nameChars : [Character] = ["S", "e", "b", "a", "s", "t", "i", "á", "n"]
var myNameAgain = String(nameChars)

// No se puede sumar un String con un Character
let compoundName = myNameAgain + String(exclamantion) // Una solución mas no la más práctica
myNameAgain.append(exclamantion) // mejor solución
print(myNameAgain)

// No puedo hacer uso de funciones del objeto hasta que no se forme el String
// var message = "Hola, buenos días".append(exclamantion)
var message = "Hola, buenos días"
message.append(exclamantion) // esta es la manera en la que se debe hacer, ya que el elemento debe formarse primero

// Subindices
let greeting = "Hola, ¿qué tal?"
greeting[greeting.startIndex]
//greeting[greeting.endIndex] No se puede hacer porque es la ultima posición -1, sin embargo no se puede restar y ya, porque Swift maneja una manera especial para manejar indices en los Strings
greeting[greeting.index(before: greeting.endIndex)] // Esta sería la manera de hacer lo anterior
greeting[greeting.index(after: greeting.startIndex)]

for idx in greeting.indices {
    print("\(greeting[idx]) - \(idx)")
}

for idx in greeting.indices {
    print("\(greeting[idx]) ", terminator: "") // El terminador por defecto es \n
}

// Modificadores
var welcome = "Hola"

welcome.insert("😁", at: welcome.endIndex) // Insertar al final SOLO UN CARACTER
welcome.insert(contentsOf: ", ¿que tal?", at: welcome.endIndex) // Insertar en x posición un String
welcome.insert("😊",
               at: welcome.index(before: welcome.endIndex)) // Insertar en x posición un caracter indicando la posición con .index() usando before

// welcome.remove(at: welcome.index(before: welcome.index(before: welcome.endIndex))) // Remover un caracter en x posición usando .index() compuestos de más .index() (Solo para eliminar antes del ultimo caracter)
welcome.remove(at: welcome.index(welcome.endIndex, offsetBy: -2)) // Remover un caracter en x posición usando offset para evitar repetir los .index() dentro de .index()
welcome

welcome.remove(at: welcome.index(welcome.startIndex, offsetBy: 4))
welcome

let range = welcome.index(welcome.endIndex, offsetBy: -11)..<welcome.endIndex // Definir un rango dentro de un String ( Desde el ultimo -11 hasta antes del ultimo)

welcome.removeSubrange(range) // Eliminar un rango dentro de un String
print(welcome)


// SubString: Extraer una pequeña parte de un String
greeting
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
var firstPart = greeting[..<index] // Esto no es un String, es un Substring, lo cual es un dato apuntando al espacio en memoria del String original y no tiene los mismos metodos que un String común

let newString = String(firstPart)


// Prefijos y sufijo
let newGreeting = "Hola, soy Sebastián García"
newGreeting.hasPrefix("Hola") // Inicia con la palabra Hola?
newGreeting.hasSuffix("l") // Termina con la palabra García?

// Ejemplo de uso: Contar cuantas Escenas son del acto 1
let collection = [
"Acto 1, Escena 1", "Acto 1, Escena 2", "Acto 1, Escena 3", "Acto 2, Escena 1", "Acto 2, Escena 2", "Acto 2, Escena 3", "Acto 2, Escena 4", "Acto 3, Escena 1"
]

var act1SceneCount = 0
for scene in collection {
    if scene.hasPrefix("Acto 1") {
        act1SceneCount += 1
    }
}
act1SceneCount


// Representaciones Unicode
let ghost = "Fantasma 👻"

for codeUnit in ghost.utf8 {
    print(codeUnit, terminator: " ")
}
print("")
for codeUnit in ghost.utf16 {
    print(codeUnit, terminator: " ")
}
print("")
for codeUnit in ghost.unicodeScalars {
    print(codeUnit, terminator: " ")
}

import UIKit

// Existen diferentes tipos de colecciones. Se dividen en 3 grupos: Arrays, Conjuntos o Sets y Diccionarios

/* Arrays */
var someInts = [Int]()
someInts.count
someInts.append(2)
someInts.count
someInts = []

var someDoubles = Array(repeating: 3.141592, count: 7)
someDoubles.count

var moreDoubles = Array(repeating: 3.2, count: 3)

var aLotOfNumbers  = someDoubles + moreDoubles
aLotOfNumbers.count

var shoppingList : [String] = ["Papas", "Tortillas", "Pimientos"]
shoppingList.count

if shoppingList.isEmpty {
print("La lista de compras está vacia")
} else {
print("Ve a comprar")
}

// Añadir nuevos elementos a un array
shoppingList.append("Cocacola")
shoppingList.count
shoppingList += ["Guacamole", "Pico de Gallo"]
shoppingList.count
shoppingList.insert("Doritos", at: 0)

// Modificar una posición
shoppingList[0] = "Huevos"
shoppingList

// Obtener el valor en una posición
var firstElement = shoppingList[0]

// Obtener un rago determinado en el array
shoppingList[2...4]
 
// Modificar un rango determinado en el array
shoppingList[2...4] = ["Mountain Dew", "Sal", "Arroz"]
shoppingList

// Remover elementos
let eggs = shoppingList.remove(at: 0)
shoppingList.remove(at: 1)

shoppingList.removeLast()

// Iterar sobre un array
for element in shoppingList {
    print(element)
}

for (i, element) in shoppingList.enumerated() {
    print(i, element)
}

/* Conjunto (Set): Es la forma más básica de almacenar objetos sin un orden en particular. En un cojunto no puede repetirse ningún elemento */

// En un set no se puede usar .append porque apendizar lo que hace es insertar al final, y los sets no tienen orden alguno
var letters = Set<Character>()
letters.count
letters.insert("a")
letters.insert("S")
letters

var favoriteGames : Set<String> = ["Final Fantasy", "Alan Wake", "Pokémon", "Zelda", "Mario Bros"]
favoriteGames.count
if favoriteGames.isEmpty {
    print("No hay juegos favoritos")
}
favoriteGames.insert("Octopath Traveler")

// Eliminar elementos de un set
if let removedGame = favoriteGames.remove("Mario Bros") { // Como puede dar nil, se debe hacer la comprobación de que exista primero
    print("He eliminado \(removedGame) de la lista de tus juegos favoritos.")
} else {
    print("Este juego no se encuentra en tu lista de juegos favoritos.")
}

// Saber si hay un elemento en el set
if favoriteGames.contains("Alan Wake"){
    print("Si tienes este juego en tus favoritos")
} else {
    print("No tienes este juego")
}

// Iterar en set
for game in favoriteGames {
    print(game)
}

// Ordenar el set
for game in favoriteGames.sorted() {
    print("-> \(game)")
}

// Operaciones entre conjuntos
let oddDigits : Set = [1,3,5,7,9]
let evenDigits : Set = [0,2,4,6,8]
let primeNumbers : Set = [2,3,5,7]

// A unión B = elementos que son o bien de A, o bien de B o de los dos conjuntos
oddDigits.union(evenDigits).sorted()

// A intersección B = elementos que son a la vez de A y de B
oddDigits.intersection(evenDigits)
oddDigits.intersection(primeNumbers).sorted()
evenDigits.intersection(primeNumbers).sorted()

// A - B = elementos que son de A pero no de B
oddDigits.subtracting(primeNumbers).sorted() // no primos impares
evenDigits.subtracting(primeNumbers).sorted() // no primos pares

// Diferencia Simetrica: A + B = (A-B) unión (B-A)
oddDigits.symmetricDifference(primeNumbers).sorted() // Los números impares que no son primos y los números pares que son primos


// subconjunto, superconjutos y disjuntos

let houseAnimals : Set = ["🐶", "🐱"]
let farmAnimals : Set = ["🐴", "🐷", "🐮", "🐤", "🐶", "🐱"]
let cityAnimals : Set = ["🐀", "🕊"]

houseAnimals.isSubset(of: farmAnimals) // Animales de casa son un subconjunto de los animales de granja
farmAnimals.isSuperset(of: houseAnimals) // Animales de granja son super conjunto de los animales de casa
farmAnimals.isDisjoint(with: cityAnimals) // ¿Los animales de granja no tienen elementos en comun con los animales de ciudad? A y B son disjuntos si su intersección es vacía


/* Diccionarios: tienen por estructura una clave y su valor. No tienen posición. Tampoco tienen las caracteristicas de un conjunto. Las claves deben ser únicas.*/

var nameOfIntegers = [Int : String]() // Declarar diccionario

nameOfIntegers[15] = "quince" // Añadir un valor a un diccionario
nameOfIntegers = [:] // Vaciar diccionario

var games : [String : String] = [:] // Crear diccionario vacío
games.isEmpty

var airports: [String: String] = ["YYZ": "Toronto",
                                  "DUB": "Dublin",
                                  "PMI": "Palma de Mallorca"
] // Crear diccionario con elementos

airports.count
airports.isEmpty

airports["LHR"] = "London City Airport"
airports["LHR"] = "London Heathrow"

// Forma canónica de actualizar valores
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") { // Se recupera el valor viejo y a la vez se actualiza
    print("El nombre del aeropuerto \(oldValue) fue actualizado.")
} else {
    print("No existe este aeropuerto")
}

if let airportName = airports["YYZ"] {
    print("El nombre del aeropuerto YYZ es \(airportName)")
} else {
    print("No existe este aeropuerto")
}

// Remover elementos de un diccionario
airports
airports["YYZ"] = nil
airports

if let removedAirport = airports.removeValue(forKey: "DUB") {
    print("El aeropuerto \(removedAirport) fue eliminado correctamente")
} else {
    print("No existe ningún aeropuerto con el código DUB")
}
airports

// Iterar sobre diccionarios
for (key, value) in airports { // Obtener key y valor
    print(key, value)
}

for key in airports.keys { // Obtener solo keys
    print(key)
}

for key in airports.values { // Obtener solo valores
    print(key)
}

let airportKeys = [String](airports.keys.sorted()) // Crear un arreglo con los keys de un diccionario

let airportValues = [String](airports.values) // Crear un arreglo con los values  de un diccionario


import UIKit

// struct vs class
// La clase tiene herencia, casting, desinicializador para liberar memoria, Y por ultimo el reference couting para saber cuantas implementaciones hay de esa clase

struct someStruct {
    // La definición del strcut va aquí
    
}

class someClass {
    // la definición de la clase va aquí
}

struct  Resolution { // Describe la resolución basada en pixeles
    // Propiedades
    var width = 0
    var height = 0
}

class VideoMode { // Describe el modo de reproducir un vídeo en tiempo de ejecución
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
}

var hd = Resolution(width: 1920, height: 1080)

var someResolution = Resolution()
let someVideMode = VideoMode()

someVideMode.resolution.height = 720 // Aunque sea una constante, los valores de adentro son modificables.
someResolution.width = 1280 // Si una strcut es constante, no se puede modificar sus valores
someVideMode.frameRate = 30.0 // Aunque sea constante se pueden modificar sus valores

// Constructores invisibles/automaticos en las structs
let anotherResolution = Resolution(width: 12, height: 12) // Ya que lo declaré como constante, no voy a poder modificar sus valores, así que debo settearlos desde el inicio con el constructor
// Los Strcut y enum  son tipos evaluados y cuando se copian no pasan por referencia

// Las clases en Swift son por referencia.
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25

let anotherTenEighty = tenEighty

anotherTenEighty.name = "Hola"
tenEighty.name
anotherTenEighty.name

if anotherTenEighty === tenEighty {
    print("Son el mismo objeto")
} else {
    print("No son el mismo objeto")
}

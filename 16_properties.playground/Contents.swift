import UIKit

// Stored properties: cualquier variable o constante que se declare dentro de una clase o estrcutra se llama Stored Property
struct FixedLengthRange {
    var firstValue : Int
    let length : Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6


// Lazy Properties: Se cargará en memoria unicamente cuando se requiera, debe ser var siempre.
class DataImporter {
    var filename = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter() // Esta variable se cargará en memoria únicamente cuando se requiera
}

// Computed Properties: Calculadas internamente
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point{
        get {
//            let centerX = origin.x + size.width/2
//            let centerY = origin.y + size.height/2
//            return Point(x: centerX, y: centerY)
            // Cuando solo se tiene una linea, el return no es obligatorio
            Point(x: origin.x + size.width/2, y: origin.y + size.height/2)
        }
//        set(newCenter) {
//            origin.x = newCenter.x - size.width/2
//            origin.y = newCenter.y - size.height/2
//        }
        set {// esto se ejecuta cuando se modifica este valor
            origin.x = newValue.x - size.width/2
            origin.y = newValue.y - size.height/2
        }
    }
}

var square = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10, height: 10))
square.center
let initialSquareCenter = square.center
square.center = Point(x: 20, y: 20)

//  Computed Properties de solo lectura: Es como tener solo el get,
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume : Double {
        width * height * depth // Si solo tendrá el get, se puede omitir ponerlo
    }
}

let cuboid = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
cuboid.volume // esta variable es solo de lectura y no se puede modificar

// Property Observers: Extensión de las Computed Properties, permiten escuchar cambios de una Stored Property
// willSet: se llama antes de cambiar el valor de una property
// didSet: se llama después de cambiar el valor de una property

class StepCounter {
    var totalSteps: Int = 0 {// Stored Property
        willSet(newTotalSteps){ // En el willSet siempre tengo referencia al newValue, pero si hago parentesis, puedo renombrarlo
            print("El número de pasos va a subir hasta \(newTotalSteps)")
        }
        didSet{ // en el didSet siempre tengo referencia al oldValue, pero si hago parentesis, puedo renombrarlo también
            if totalSteps > oldValue {
                print("El número de pasos ha incrementado en \(totalSteps + oldValue) ")
            }
        }
    }
}

let stepCounter = StepCounter()

stepCounter.totalSteps = 200

// Ejemplo: Jugador con 100 de vida, que puede ganar o perder vida
class Player {
    var hp: Int16 = 100 {
        willSet {
            if newValue > hp {
                print("Te has curado.")
            } else {
                print("Te has hecho daño.")
            }
        }
        didSet {
            if oldValue > hp {
                print("Has perdido \(oldValue - hp) HP.")
            } else {
                if hp > 100 {
                    hp = 100
                }
                print("Has recuperado \(hp - oldValue) HP.")
            }
            if hp > 0 {
                print("Ahora tienes \(hp) HP.")

            } else {
                print("Game over")
            }
        }
    }
}

let newPlayer = Player()

newPlayer.hp = 200
newPlayer.hp = 1
newPlayer.hp = 0
newPlayer.hp = 12
newPlayer.hp += 14
newPlayer.hp -= 25

// Type Properties: Variables de Tipo de dato , las marcamos como Static y estas se compartirán para todas las instancias de la misma clase.
struct someStruct {
    var counter = 0
    static var storedTypeProperty = "SOME VALUE"
    static var computedTypeProprety : Int {
        return 1
    }
}
someStruct.computedTypeProprety // Las variables Staticas son solo accesibles por medio de la clase, no de las instancias. Porque no dependen de las instancias.

class SomeClass {
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty : Int {
        return -9
    }
    // Si llego a querer sobreescribir esta computed property al heredarla en una clase hijo, deberé nombrarla como class. Si la dejo como static, será una variable que en los hijos valdrá siempre lo mismo y no será sobreescribible.
    class var overrideableComputedTypeProperty: Int {
        return 10
    }
}


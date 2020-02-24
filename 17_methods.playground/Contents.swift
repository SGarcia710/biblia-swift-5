import UIKit

// Los Métodos forman parte de una estructura o clase y son simplemente funciones ligadas al objeto o a la clase.


// En el caso que vayan ligados al objetos, serán llamados métodos de instancia de clase.

// En el caso de que vayan ligados a la clase, serán llamados métodos de clase y estos se nombrarán con static al inicio.

// Los métodos deberán ir dentro de una clase o estructura para ser asociados a las mismas.

class Counter {
    var count = 0
    // Métodos de instancia:
    func increment () {
        self.count += 1
    }
    func increment(by amount: Int) {
        self.count += amount
    }
    func reset() {
        self.count = 0
    }
}

let counter = Counter()
counter.increment()
counter.increment(by: 8)
counter.reset()

struct Point {
    var x = 0.0, y = 0.0
    func isToTheRight(of x: Double) -> Bool {
        return self.x > x
    }
    // Los valores de una estructura o enum, son inmutables. Así que una función no puede cambiar estos valores, salvo que, la función sea mutable (mutating)
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
//        self.x += deltaX
//        self.y += deltaY
        self = Point(x: self.x + deltaX, y: self.y + deltaY)
    }
}

var somePoint = Point(x: 4, y: 5)
somePoint.isToTheRight(of: 1)
somePoint.isToTheRight(of: 54)
somePoint.moveBy(x: 12, y: 12)// El metodo mutating me permitirá modificar ambos datos


// Mutating Methods en enum
enum DifferentStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
            case .off:
                self = .low
            case .low:
                self = .high
            case .high:
                self = .off
        }
    }
    
}

var controllerStatus = DifferentStateSwitch.off
controllerStatus.next()
controllerStatus.next()

// Class Methods
class SomeClass {
    // Puedo usar class o static: Class para sobreescribirla en sus hijos a la hora de la herencia, o la palabra static para dejarla inmodificable.
    class func someMethod () {
        print("Hola ")
    }
}
SomeClass.someMethod()

struct LevelTracker { // Dentro de una estructura tengo que usar si o si la palabra static, no se puede usar la palabra class
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    // Class/Struct methods: Estos los compartiran todas las instancias de esta estructura
    static func unlock(_ level: Int){
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    // Mutating methods: Ya que la struct es inmutable, debo crear funciones mutating si quiero modificar sus valores
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) { // Aquí debo nombrar a la clase para usar este metodo aunque esté dentro de ella, porque el metodo donde la estoy llamando no es estatico. No se pueden mezclar las cosas estaticas y las no estaticas
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    
    func completeLevel(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name: String) { // Si una variable no ha sigo asignada, necesito de algun modo hacerlo
        self.playerName = name
    }
}

var player = Player(name: "Sebastián")
player.completeLevel(level: 2)

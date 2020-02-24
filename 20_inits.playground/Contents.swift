import UIKit

// Constructores/inicializadores

struct Fahrenheit {
    var temperature : Double
    
    init() {
        self.temperature = 32
    }
}

var f1 = Fahrenheit()

struct Celsius {
    var temperature: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        self.temperature = (fahrenheit - 32) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        self.temperature = kelvin - 273.15
    }
    
    init(_ celsius: Double){
        self.temperature = celsius
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212)
let freezingPoingOfWater = Celsius(fromKelvin: 273.15)
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        self.red = white
        self.green = white
        self.blue = white
    }
}

let magenta = Color(red: 1, green: 0, blue: 1)
let halfGrey = Color(white: 0.5)
let green = Color(red: 0, green: 1, blue: 0)

let bodyTemperature = Celsius(37)

class SurveyQuestion {
    let text: String
    var response: String? // Las variables opcionales no hay que inicializarlas ni ponerlas en el constructor.
    
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let q1 = SurveyQuestion(text: "¿Te gustan los tacos?")
q1.ask()
q1.response = "Sí, me gustan todos ellos."

/* Constructores dentro de clases y subclases: existen dos tipos: designados y por conveniencia. */

// Reglas:
// Desginados: El constructor designado solo puede llamar a un designado de la clase padre
// Conveniencia: Solo puede llamar a otro init de la misma clase.
// El último init que se llame siempre debe ser designado

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) ruedas"
    }
}

let vehicle = Vehicle()
vehicle.description


class Bicycle : Vehicle {
    override init() { // Cuando tengo un inicializador que reemplaza el del padre, es Designado
        super.init() // Así que al tener un inicializador Designado, hay que llamar al inicializador del padre.
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
bicycle.description

class Hoverboard: Vehicle {
    var color: String
    init(color: String) { // Cuando tengo un inicializador que solo reemplaza o inicializa una propiedad de la misma clase (Hijo en este caso), es por Conveniencia
        self.color = color // Así que solo inicializo las propiedades del mismo. (Hijo)
        // Aquí se llama implícitmente a super.init()
    }
    override var description: String {
        return "\(super.description) en el color \(self.color)."
    }
}

let hoverboard = Hoverboard(color: "Gris")
hoverboard.numberOfWheels = 2
hoverboard.description

/* Failables Inits */
enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    
    init?(symbol: Character) {
        switch symbol {
            case "K":
                self = .kelvin
            case "C":
                self = .celsius
            case "F":
                self = .fahrenheit
            default:
                return nil // Failable initializer: Un inicializador que puede dar lugar a fallo. De ser así, debo marcar el inicializador con ? después de la palabra init.
        }
        
    }
}

let someUnit = TemperatureUnit(symbol: "X") // Como puede dar nil, este objeto es un optional, por lo tanto toca aplicar la teoría de wrapping. Usar un force wrapping, safe wrapping o guard wrapping

// Propagación de optionals
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

class CartItem: Product{
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 {
            return nil
        }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let someSocks = CartItem(name: "Socks nike", quantity: -1) {
    print("\(someSocks.name) - \(someSocks.quantity)")
}
 
// Desinit (Desinicializador)
class Bank {
    static var coinsInBank = 2_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        self.coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

var p1: Player? = Player(coins: 100) // Debo hacerlo opcional para poder desinicializarlo.
Bank.coinsInBank

p1!.win(coins: 2_000)

Bank.coinsInBank

p1 = nil // Aquí se ejecuta el deinit, y manda todas las monedas al banco.

Bank.coinsInBank

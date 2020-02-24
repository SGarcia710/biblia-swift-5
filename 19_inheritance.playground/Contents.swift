import UIKit

// Herencia

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        "Viajando a \(currentSpeed)km/h"
    }
    func makeNoise () {
        // do nothing, porque cada vehículo tiene su propio ruido.
    }
}

let someVehicle = Vehicle()
someVehicle.description

class Bicycle : Vehicle {
    final var hasBasket = false// Final es el modificador que se utiliza para evitar que un metodo, propiedad o subindice sea sobreescrita
}

let someBicycle  = Bicycle()
someBicycle.description

class Tandem : Bicycle {
    var currentNumberOfPassengers = 0
}

let someTandem = Tandem()
someTandem.hasBasket = true
someTandem.currentNumberOfPassengers = 2
someTandem.currentSpeed = 22.2
someTandem.description


// Sobrescritura de metodos: override
class Train: Vehicle {
    var numberOfWagons = 0
    
    override func makeNoise() {
        print("Choo Chooo")
    }
}

let someTrain = Train()
someTrain.makeNoise()

class Car: Vehicle {
    var gear = 1
    override var description: String {
        super.description + " en la marcha \(gear)."
    }
}

let someCar = Car()
someCar.description

class AutomaticCar: Car {
    override var currentSpeed: Double{
        didSet{
            gear = Int(currentSpeed / 15.0) + 1
        }
    }
}

let someAutomaticCar = AutomaticCar()
someAutomaticCar.currentSpeed = 60
someAutomaticCar.description

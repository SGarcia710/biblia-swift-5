import UIKit

func canThrowError() throws{
    
}

do {
    try canThrowError()
    // Si llegamos aquí, es porque no se ha ocasionado el posible error de la función
} catch {
    // Si el posible error si pasó, entraremos directamente acá después de ejecutar la función
}

// Ejemplo
var cleanDishes = 0
var ingredientes = 10
var haveHungry: Bool = true

enum sandwichError: Error{
    case noCleanDishes
    case noIngredients
    case noHungry
}

func makeASandwich()throws{
    if cleanDishes < 1 {
        throw sandwichError.noCleanDishes
    }
    if ingredientes < 4 {
        throw sandwichError.noIngredients
    }
    if haveHungry == false {
        throw sandwichError.noHungry
    }
    print("Me hago un sandwich")
}


do{
    try makeASandwich()
    //Me como el sandwich
    print("Me como el sandwich")
}catch(sandwichError.noCleanDishes){
    //tengo platos limpios ...-> Lavar los platos
        print("lava 1 plato")
}catch (sandwichError.noIngredients){
    //tengo ingredientes -> Ir a hacer la compra
        print("compra ingredientes")
}catch (sandwichError.noHungry){
    //tengo hambre -> Esperar a tener hambre
        print("Esperar a tener hambre")
}

// Aserciones (debug)
let age = 10
assert(age > 0, "La edad de una persona no puede ser negativa") // Si la condición da falso, tira el mensaje de error

if age > 10 {
    "Puedes entrar "
} else if age >= 0 {
    print("Eres demasiado pequeño para entrar")
} else {
    assertionFailure("La edad de una persona no puede ser negativa") // Así se tiran asserts directos
}

// precondiciones (Build) (Seguridad y robustez para mi aplicación)
let dinero = 3001
precondition(dinero > 3000, "Te falta dinero")



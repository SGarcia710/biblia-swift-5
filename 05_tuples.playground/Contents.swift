import UIKit

// Tuplas, el ejemplo tipico es cuando quieres mostrar un código de error y el mensaje
let http404Error = (404, "Page not found")
print(http404Error)

// Destructuración
let (statusCode, statusMessage) = http404Error
print("El código de estado es \(statusCode)")
print("El mensaje de error es \(statusMessage)")

//  Extraer solo un valor especifico de una tupla
let(justStatusCode, _) = http404Error
print(justStatusCode)

// Acceder a valores especificos de una tupla
print(http404Error.0)
print(http404Error.1)

// Utilizar keys para los valores de una tupla
let http200Status = (statusCode: 200, description: "OK")
print(http200Status)
print(http200Status.statusCode, http200Status.description)

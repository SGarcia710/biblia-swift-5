import UIKit

// Enteros
let age : UInt8 = 23

let minValue = UInt8.min
let maxValue = UInt8.max

let maxMediumValue = UInt32.max
let maxMaxValue = UInt64.max

let float1 : Float = 3.14159265 // Float solo tiene 6 decimales
let double1 : Double = 3.14159265 //  en caso de necesitar más, usar Double que tiene 15-16 cifras decimales

// Type Save
let theMeaningOfLife = 42 // Double
let pi = 3.14159 // Double
let anotherPi = 3 + 0.14159 // Double


// Enteros literales

// En base 10 (Lo que llamamos decimal)
let decimalInteger = 17 // 1*10 + 7
let binaryInteger = 0b10001 // 1*2^4+0*2^3+0*2^2+0*2^1+1*2^0
let octalInteger = 0o21 // 2*8^1+1*8^0
let hexadecimalInteger = 0x11 // 1*16^1+1*16^0


// Diferentes formas de escribir los números con notación cientifica (nomenclaturas)
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

// puedes usar 0 a la izquierda sin problemas
let paddedDouble = 000123.456
let someNumber = 00000096.45 // Esto ayuda a que se puedan alinear los números cuando se quieren comprar

// Swift permite separar cada 3 cifras de números con underscore
let oneMillion = 1_000_000
let justMoreThanAMillion = 1_000_000.000_000_001 // Funciona también en la parte decimal

// Si un número no puede ser negativo está claro que se debe definir como unsigned
let cannotBeNegative : UInt8

// Recordar usar bien las variables para evitar asignar memoria innecesaria cuandos abemos que no necesitamos tanto espacio para un dato.


// Casteo (Parse)
let twoThousand : UInt16 = 2_000
let one : UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

let three = 3
let decimalNumber = 0.14159
let pi2 = Double(three) + decimalNumber

let piInt = UInt8(pi2) // Truncamiento (Truncar es tomar desde el punto decimal hasta adelante y cortarlo)

// Alias
// typealias type name = type expression
typealias AudioSample = UInt16 // Esto renombra

let sample1 : AudioSample = AudioSample.max

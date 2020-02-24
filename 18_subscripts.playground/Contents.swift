import UIKit

// Subscripts: Subindices, algo de Swift.
struct TimesTable{
    let multiplier: Int
    
    subscript(index: Int) -> Int {
        // Puede tener un set y un get, es como una computed property
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
for number in 1...10 {
    print("3 x \(number) = \(threeTimesTable[number])")
}

// Se puede usar tanto en los enum, como class y structs

enum Planet: Int{
    case mercury = 1, venus, earth, mars, jupyter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}

let mars = Planet[4]
mars

// Subindices con matrices
struct Matrix {
    let rows: Int, columns: Int
    var grid : [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid (row: Int, column: Int) -> Bool {
        return row >= 0 && column >= 0 && row < self.rows && column < self.columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get{
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[( row * columns ) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[( row * columns ) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 0] = 1
matrix[0, 1] = 2
matrix[1, 0] = 3
matrix[1, 1] = 4

//
//  main.swift
//  Blocks-Assignment-Swift
//
//  Created by Omsai Mutyalwar on 26/08/26.
//

import Foundation

// Code that calls the above implemented functions
let numbers = CustomIntegerArray(values: [5, 2, 8, 1, 9, 3])
// 1. filter
let evens = numbers.filter { $0 % 2 == 0 }
print("Evens: \(evens)")
// Prints:
// Evens: [2, 8]

// 2. reduce
let sum = numbers.reduce({ partial, value in partial + value }, initialValue: 0)
print("Sum: \(sum)") // Prints: Sum: 28

// 3. sorted
let sorted = numbers.sorted { a, b in a < b }
print("Sorted: \(sorted)")
// Prints:
// Sorted: [1, 2, 3, 5, 8, 9]

// 4. forEach
numbers.forEach { value in
print("Value: \(value)")
}
// Prints:
// Value: 5
// Value: 2
// Value: 8
// Value: 1
// Value: 9
// Value: 3

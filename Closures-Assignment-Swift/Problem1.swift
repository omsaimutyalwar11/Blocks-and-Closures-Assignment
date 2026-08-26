// Swift - Problem statement 1

// CustomIntegerArray.swift
typealias FilterPredicateClosure = (Int) -> Bool
typealias ReduceClosure = (Int, Int) -> Int
typealias SortClosure = (Int, Int) -> Bool
typealias ForEachClosure = (Int) -> Void

class CustomIntegerArray {
    private var storage: [Int]

    init(values: [Int]) {
        storage = values
    }

    func filter(_ predicate: FilterPredicateClosure) -> CustomIntegerArray {
        let result = CustomIntegerArray(values: [])
        for value in storage {
            if predicate(value) {
                result.storage.append(value)
            }
        }
        return result
    }

    func reduce(_ reducer: ReduceClosure, initialValue: Int) -> Int {
        var result = initialValue
        for value in storage {
            result = reducer(result, value)
        }
        return result
    }

    func sorted(by comparator: SortClosure) -> CustomIntegerArray {
        var sortedStorage = storage
        for i in 0..<sortedStorage.count {
            for j in 0..<sortedStorage.count - i - 1 {
                if !comparator(sortedStorage[j], sortedStorage[j + 1]) {
                    let temp = sortedStorage[j]
                    sortedStorage[j] = sortedStorage[j + 1]
                    sortedStorage[j + 1] = temp
                }
            }
        }
        return CustomIntegerArray(values: sortedStorage)
    }

    func forEach(_ action: (Int) -> Void) {
        for value in storage {
            action(value)
        }
    }
}

extension CustomIntegerArray: CustomStringConvertible {
    var description: String {
        return "\(storage)"
    }
}

/*
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

 */

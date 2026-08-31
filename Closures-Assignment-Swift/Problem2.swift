// Swift - Problem statement 2
import Foundation

// MARK: - Demonstration 1: Error from storing non-escaping closure in property

class Handler {
    // Property to store closures
    var storedClosure: (() -> Void)?

    func performSync(closure: () -> Void) {
        closure()
    }

    func performAsync(completion: @escaping () -> Void) {
        DispatchQueue.global().async {
            completion()
        }
    }
}

// MARK: - Explanation

/*
Errors:

 1. Storing performSync closure in a property:
    Error: "Assigning non-escaping parameter 'closure' to an @escaping closure"

 2. Omitting @escaping on performAsync:
    Error: "Escaping closure captures non-escaping parameter 'completion'"

- Why escaping needs explicit self/[weak self]:

Because an escaping closure can outlive the function's stack frame and capture self strongly, it may create a retain cycle if self also owns it, while a non-escaping closure runs and is released immediately before returning.
*/

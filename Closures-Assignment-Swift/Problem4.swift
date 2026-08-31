// Swift - Problem statement 4
import Foundation

class NetworkManager {

    func processData() {
        print("Test data.")
    }

    var onComplete: (() -> Void)?

    // Fix 1 - Using Optional chaining.
    func startRequest1() {
        onComplete = { [weak self] in
            self?.processData()
        }
    }

    // Fix 2 - Using guard let.
    func startRequest2() {
        onComplete = { [weak self] in
            guard let self = self else {
                return
            }

            self.processData()
        }
    }
}

// MARK: - When to use each style:

/*
FIX #1 - Optional Chaining:
- We will use [weak self] with optional chaining, for simple closures with a single self access and no conditional logic.
 e.g,
 self?.test()

FIX #2 - guard Let:
- We will use [weak self] with guard let self = self else { return }, for complex closures with multiple self accesses or conditional logic.
 - Key distinction: guard let self holds self alive for the entire closure body, ensuring all statements execute or none do. With optional chaining, self can be deallocated between lines, leaving work partially executed.
 e.g,
 guard let self = self else {
     return
 }

 self.test1()
 self.test2()
*/

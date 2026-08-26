// Swift - Problem statement 5
import Foundation

typealias CompletionHandler = (Data?, Error?) -> Void

class Service {
    var onComplete: CompletionHandler?

    func fetchData(completion: CompletionHandler?) {
        let data = Data("sample data".utf8)
        completion?(data, nil)
    }
}

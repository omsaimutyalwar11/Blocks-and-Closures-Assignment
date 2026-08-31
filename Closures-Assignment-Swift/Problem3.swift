// Swift - Problem statement 3
import Foundation

class DownloadViewController: UIViewController {
    let networkClient: NetworkClient
    var completionClosure: (() -> Void)?

    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }

    func startDownload() {
        networkClient.fetchData { [weak self] in
            guard let self = self else {
                return
            }

            // The outer closure already carries `[weak self]`, but inside the guard
            // `guard let self = self` re-strengthens it to a non-optional local strong
            // reference. The nested closure then captures that strong local, and capture
            // lists do not propagate into nested closures. That's why the inner closure
            // still needs its own `[weak self]` to break the retain cycle.
            self.completionClosure = { [weak self] in
                self?.updateUI()
            }
        }
    }

    func updateUI() {
        print("Updating UI")
    }
}

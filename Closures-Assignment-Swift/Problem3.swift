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

            // [weak self] in the inner closure to break the retain cycle.
            self.completionClosure = { [weak self] in
                self?.updateUI()
            }
        }
    }

    func updateUI() {
        print("Updating UI")
    }
}

import SwiftUI
import Combine

class AsyncImageLoader: ObservableObject {
    @Published var image: UIImage?

    func load(imageName: String) {
        DispatchQueue.global().async {
            let image = UIImage(named: imageName)
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}


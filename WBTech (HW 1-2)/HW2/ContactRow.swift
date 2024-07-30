import SwiftUI

struct ContactRow: View {
    var name: String
    var status: String
    var imageName: String
    @ObservedObject private var imageLoader = AsyncImageLoader()
    init(name: String, status: String, imageName: String) {
        self.name = name
        self.status = status
        self.imageName = imageName
        self.imageLoader.load(imageName: imageName)
    }

    var body: some View {
        HStack {
            if let image = imageLoader.image {
                ImageWithStatus(image: Image(uiImage: image), imageName: imageName, name: name, status: status)
            } else {
                ImageWithStatus(image: Image(systemName: "person.crop.circle"), imageName: imageName, name: name, status: status)
            }
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                Text(status)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.vertical, 4)
    }
}


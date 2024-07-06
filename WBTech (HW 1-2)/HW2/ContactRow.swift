import SwiftUI

struct ContactRow: View {
    var name: String
    var status: String
    var imageName: String
    
    var body: some View {
        HStack {
            ImageWithStatus(imageName: imageName, name: name, status: status)
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


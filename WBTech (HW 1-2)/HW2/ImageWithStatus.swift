import SwiftUI

struct ImageWithStatus: View {
    var image: Image
    var imageName: String
    var name: String
    var status: String

    var body: some View {
        ZStack(alignment: .center) {
            if imageName == "people5" || imageName == "people6" {
                Rectangle()
                    .fill(Color.customColoreTwo)
                    .frame(width: 48, height: 48)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                Text("\(name.prefix(1))\(name.split(separator: " ").last?.prefix(1) ?? "")")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            } else {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 48, height: 48)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            
            if status.contains("Online") {
                Circle()
                    .fill(Color.green)
                    .frame(width: 12, height: 12)
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 2)
                    )
                    .offset(x: 18, y: -21)
            }
        }
    }
}


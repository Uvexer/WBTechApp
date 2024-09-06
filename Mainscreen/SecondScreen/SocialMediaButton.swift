import SwiftUI

struct SocialMediaButton: View {
    var imageName: String
    
    var body: some View {
        Button(action: {
            print("\(imageName) tapped")
        }) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 71, height: 41)
        }
    }
}


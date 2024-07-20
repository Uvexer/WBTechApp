import SwiftUI

struct MainImageView: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 262, height: 271)
    }
}

struct MainImageView_Previews: PreviewProvider {
    static var previews: some View {
        MainImageView(imageName: "lightpeoples")
    }
}


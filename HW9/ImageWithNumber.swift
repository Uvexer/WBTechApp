import SwiftUI
struct ImageWithNumberView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View{
        HStack {
            Image("russia")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 16)
            Text("+7")
                .fontWeight(.medium)
                .foregroundStyle(Color.customColoreFive)
        }
        .padding(.horizontal, 8)
        .frame(height: 40)
        .background(colorScheme == .dark ? .customColoreSix : Color.customColoreFour)
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}




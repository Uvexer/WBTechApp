import SwiftUI
struct ButtonBack2View: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(colorScheme == .dark ? "vectorDark" : "arrov")
                    .foregroundColor(.customColoreThree)
                    .frame(width: 24, height: 24)
            }
            .padding()

            Spacer()
        }
    }
}

struct ButtonBack2View_Previews : PreviewProvider{
    static var previews: some View {
        ButtonBack2View()
    }
}


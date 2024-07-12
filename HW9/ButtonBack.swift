import SwiftUI
struct ButtonBackView: View{
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    var body: some View{
        
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
struct ButtonBackView_Previews : PreviewProvider{
    static var previews: some View {
        ButtonBackView()
    }
}


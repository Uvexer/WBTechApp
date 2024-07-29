import SwiftUI
public struct ButtonBackView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    public init() {}
    
    public var body: some View {
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

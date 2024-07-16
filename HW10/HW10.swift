import SwiftUI
struct ContentView10: View {
    var body: some View {
        VStack {
            ButtonBack2View()
            TextAddCodeView()
            CodeInputView()
            Spacer()
            ReturnCodeView()
                .simultaneousGesture(TapGesture().onEnded { _ in
                    self.dismissKeyboard()
                })
        }
    }    
}

#Preview {
    ContentView10()
}

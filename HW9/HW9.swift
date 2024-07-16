import SwiftUI

struct ContentView9: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isVisible = true
    @State private var showNewScreen = false 

    var body: some View {
        VStack {
            if isVisible {
                ButtonBackView()
                TextAddNumberView()

                HStack(spacing: 10) {
                    ImageWithNumberView()
                    .padding(.leading)
                    CustomTextFieldView()
                    .padding(.trailing)

                }
                Spacer().frame(height: 50)
                ButtonContinueView(isVisible: $isVisible, showNewScreen: $showNewScreen)
            }
        }
        .fullScreenCover(isPresented: $showNewScreen) {
            ContentView10()
        }
        .contentShape(Rectangle())
        .simultaneousGesture(TapGesture().onEnded { _ in
            self.dismissKeyboard()
        })
        .navigationBarHidden(true)
        .background(colorScheme == .dark ? Color.customColoreOne : Color.white)
        .transition(.opacity)
    }
}


struct ContentView9_Previews: PreviewProvider {
    static var previews: some View {
        ContentView9()
    }
}

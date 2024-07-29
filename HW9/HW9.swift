import SwiftUI
import UISystem

struct ContentView9: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isVisible = true

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
                ButtonContinueView(isVisible: $isVisible)
            }
        }
        .contentShape(Rectangle())
        .simultaneousGesture(TapGesture().onEnded { _ in

        })
        .navigationBarHidden(true)
        .background(colorScheme == .dark ? Color.customColoreOne : Color.white)
        .transition(.opacity)
        .animation(.easeInOut(duration: 0.5), value: isVisible)
    }
}


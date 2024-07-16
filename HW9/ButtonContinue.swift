import SwiftUI

struct ButtonContinueView: View {
    @Binding var isVisible: Bool
    @Binding var showNewScreen: Bool
    @State private var showProgress = false

    var body: some View {
        VStack(alignment: .leading) {
            if !showProgress {
                Button(action: {
                    withAnimation {
                        showProgress = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            isVisible = false
                            showNewScreen = true 
                        }
                    }
                }) {
                    Text("Продолжить")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 52)
                        .background(Color.customColoreTwo)
                        .cornerRadius(30)
                }
                .padding()
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.customColoreTwo))
                    .scaleEffect(1.5)
                    .transition(.opacity)
                    .padding()
            }
            Spacer()
        }
    }
}

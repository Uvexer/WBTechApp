import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var navigateToNextView = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 145)
                
                MainImageView(imageName: colorScheme == .dark ? "darkpeoples" : "lightpeoples")
                
                Spacer().frame(height: 45)
                
                CustomTextView(text: "Общайтесь с друзьями и близкими легко", colorScheme: colorScheme)
                
                Spacer()
                
                AgreementTextView()
                
                NavigationLink(destination: ContentView9(), isActive: $navigateToNextView) {
                    StartButtonView(showingSheet: $navigateToNextView)
                }
                .padding(.bottom, 45)
            }
            .padding(.horizontal, 60)
            .background(colorScheme == .dark ? Color.customColoreOne : Color.white)
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


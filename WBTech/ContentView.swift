import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Spacer().frame(height: 145)
            
            MainImageView(imageName: colorScheme == .dark ? "darkpeoples" : "lightpeoples")
           
            Spacer().frame(height: 45)
            
            CustomTextView(text: "Общайтесь с друзьями и близкими легко", colorScheme: colorScheme)
             
            Spacer()
            
            AgreementTextView()
            
            StartButtonView(showingSheet: $showingSheet)
                .padding(.bottom, 45)
                .sheet(isPresented: $showingSheet) {
                    ModalView()
                        .background(colorScheme == .dark ? Color.black : Color.white)
                        .edgesIgnoringSafeArea(.all)
                }
        }
        .padding(.horizontal)
        .background(colorScheme == .dark ? Color.customColoreThree : Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


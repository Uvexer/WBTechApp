import SwiftUI

struct StartButtonView: View {
    @Binding var showingSheet: Bool
    
    var body: some View {
        Button(action: {
            showingSheet = true
        }) {
            Text("Начать общаться")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 327, height: 52)
                .background(Color.customColoreTwo)
                .cornerRadius(30)
                .frame(width: 320)
                .padding(.horizontal)
        }
    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView(showingSheet: .constant(false))
    }
}



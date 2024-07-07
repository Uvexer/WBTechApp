import SwiftUI
struct ContentView3: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Cюда что-нибудь придумаю,\nвиджет в папке HW3 widget ")
                    .font(.title3)
                    .padding()

                Spacer()
            }
        }
    }
}

struct ViewForHW3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}


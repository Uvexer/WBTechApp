import SwiftUI
struct ContentView4: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Cюда что-нибудь придумаю \nв тз консольное приложение\nвсе в папке HW4")
                    .font(.title3)
                    .padding()

                Spacer()
            }
        }
    }
}

struct ViewForHW4_Previews: PreviewProvider {
    static var previews: some View {
        ContentView4()
    }
}



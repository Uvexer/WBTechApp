import SwiftUI
import NetworkModul

struct ContentView16: View {
    @StateObject private var viewModel = UserViewModel()

    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
            } else {
                List(viewModel.users) { user in
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.email)
                            .font(.subheadline)
                    }
                }
                .navigationTitle("Users")
            }
        }
    }
}




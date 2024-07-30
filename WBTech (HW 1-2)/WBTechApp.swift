import SwiftUI

@main
struct WBTechApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView13(viewModel: DependencyInjector.shared.makeMemoryGameViewModel())
        }
    }
}


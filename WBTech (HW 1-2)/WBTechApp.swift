import SwiftUI

@main
struct WBTechApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            GeneralView()
                .environment(modelData)
        }
    }
}


import AppIntents

struct OpenAppIntent: AppIntent {
    static var title: LocalizedStringResource = "Open App"
    
    func perform() async throws -> some IntentResult {
        return .result()
    }
}




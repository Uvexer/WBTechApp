import Foundation

struct Card: Identifiable {
    let id: UUID = UUID()
    let content: String
    var isFaceUp: Bool = false
    var isMatched: Bool = false
}


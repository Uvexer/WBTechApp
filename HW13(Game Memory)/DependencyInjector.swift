import Foundation

class DependencyInjector {
    static let shared = DependencyInjector()
    
    func makeMemoryGameViewModel() -> MemoryGameViewModel {
        let emojis = ["👻", "🎃", "🕷", "🧙‍♂️", "🧛‍♂️", "🧟‍♂️"]
        let cards = (emojis + emojis).shuffled().map { Card(content: $0) }
        return MemoryGameViewModel(cards: cards)
    }
}


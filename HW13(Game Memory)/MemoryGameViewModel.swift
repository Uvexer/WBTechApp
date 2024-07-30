import SwiftUI

class MemoryGameViewModel: ObservableObject {
    @Published private(set) var cards: [Card]
    
    private var indexOfFaceUpCard: Int?
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
                indexOfFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                cards[chosenIndex].isFaceUp = true
                indexOfFaceUpCard = chosenIndex
            }
        }
    }
}


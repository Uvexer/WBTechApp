import SwiftUI

struct ContentView13: View {
    @ObservedObject var viewModel: MemoryGameViewModel
    
    var body: some View {
        VStack {
            Grid(items: viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation {
                        viewModel.choose(card: card)
                    }
                }
                .padding(5)
            }
            .padding()
        }
    }
}

struct ContentView13_Previews: PreviewProvider {
    static var previews: some View {
        let emojis = ["👻", "🎃", "🕷", "🧙‍♂️", "🧛‍♂️", "🧟‍♂️"]
        let cards = (emojis + emojis).shuffled().map { Card(content: $0) }
        let viewModel = MemoryGameViewModel(cards: cards)
        
        return ContentView13(viewModel: viewModel)
    }
}

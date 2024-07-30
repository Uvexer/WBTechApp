import SwiftUI

struct CardView: View {
    var card: Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp || card.isMatched {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.4))
                Text(card.content)
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.orange)
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
    }
}


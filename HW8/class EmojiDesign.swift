import Foundation

class EmojiDesign: Identifiable, ObservableObject, Equatable {
    let id = UUID()
    @Published var symbol: String
    @Published var sizes: [CGSize]

    init(symbol: String, sizes: [CGSize]) {
        self.symbol = symbol
        self.sizes = sizes
    }

    static func randomDesign() -> EmojiDesign {
        let totalWidth: CGFloat = 300
        let height1 = CGFloat.random(in: 20...80)
        let height2 = height1
        let height3 = 100 - height1

        let size1 = CGSize(width: CGFloat.random(in: 120...180), height: height1)
        let size2 = CGSize(width: totalWidth - size1.width, height: height2)
        let size3 = CGSize(width: totalWidth, height: height3)

        let randomSymbol = (0x1F300...0x1F3F0).compactMap(UnicodeScalar.init).map(String.init).randomElement() ?? "❓"
        return EmojiDesign(symbol: randomSymbol, sizes: [size1, size2, size3])
    }
    static func ==(lhs: EmojiDesign, rhs: EmojiDesign) -> Bool {
        lhs.id == rhs.id
    }
}

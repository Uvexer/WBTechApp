import SwiftUI

struct ContentView8: View {
    @State private var designs: [EmojiDesign] = []

    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(spacing: 15) {
                    ForEach(designs) { design in
                        EmojiBlockView(design: design)
                            .onAppear {
                                if design == designs.last {
                                    loadMoreDesigns()
                                }
                            }
                    }
                }
            }
        }
        .onAppear {
            loadMoreDesigns()
        }
    }

    private func loadMoreDesigns() {
        designs += (1...20).map { _ in EmojiDesign.randomDesign() }
    }
}

struct ContentView8_Previews: PreviewProvider {
    static var previews: some View {
        ContentView8()
    }
}


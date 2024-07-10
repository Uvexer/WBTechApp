import SwiftUI

struct EmojiBlockView: View {
    @ObservedObject var design: EmojiDesign

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 25)
                        .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                        .frame(width: design.sizes[0].width, height: design.sizes[0].height)
                        .foregroundColor(.blue)

                    RoundedRectangle(cornerRadius: 25)
                        .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                        .frame(width: design.sizes[1].width, height: design.sizes[1].height)
                        .foregroundColor(.orange)
                }
                RoundedRectangle(cornerRadius: 25)
                    .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .frame(width: design.sizes[2].width, height: design.sizes[2].height)
                    .foregroundColor(.red).opacity(0.7)
            }
            Text(design.symbol)
                .font(.largeTitle)
                .opacity(0.8)
        }
    }
}


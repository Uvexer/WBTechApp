import SwiftUI

struct GridLayout {
    var size: CGSize
    var rowCount: Int
    var columnCount: Int
    
    init(itemCount: Int, in size: CGSize) {
        self.size = size
        self.rowCount = Int(sqrt(Double(itemCount)).rounded(.up))
        self.columnCount = (itemCount + (rowCount - 1)) / rowCount
    }
    
    var itemSize: CGSize {
        CGSize(width: size.width / CGFloat(columnCount), height: size.height / CGFloat(rowCount))
    }
    
    func location(ofItemAt index: Int) -> CGPoint {
        let row = index / columnCount
        let column = index % columnCount
        return CGPoint(x: CGFloat(column) * itemSize.width + itemSize.width / 2, y: CGFloat(row) * itemSize.height + itemSize.height / 2)
    }
}


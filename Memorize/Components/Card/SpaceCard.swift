import SwiftUI

struct CardSpace: View {
    
    let size : CGFloat
    let color : Color
    
    var body: some View {
        let width = size * 100
        let height = size * 125
        
        Rectangle()
            .fill(color.opacity(0))
            .padding(size * 10)
            .frame(width: width, height: height)
    }
}

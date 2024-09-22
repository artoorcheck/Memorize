import SwiftUI

struct CardFront : View {
    let size : CGFloat
    let icon: String
    @Binding var degree : Double
    @ObservedObject var preferences: Preference

    var body: some View {
        ZStack {
            let width = size * 100
            let height = size * 125
            
            RoundedRectangle(cornerRadius: size * 10)
                .fill(.white)
                .frame(width: width, height: height)
                .shadow(color: preferences.shirtColors[2], radius: 2, x: 0, y: 0)
            let uiImage = icon.image()!
            Image(uiImage: uiImage)
                .resizable()
                .frame(width: size * 60, height: size * 70)

        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

import SwiftUI

struct CardBack : View {
    let size : CGFloat
    @Binding var degree : Double
    @ObservedObject var preferences: Preference

    var body: some View {
        ZStack {
            let width = size * 100
            let height = size * 125
            let cornerRadius = size * 10
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(preferences.shirtColors[0], lineWidth: 3)
                .frame(width: width, height: height)

            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(preferences.shirtColors[1])
                .frame(width: width, height: height)
                .shadow(color: preferences.shirtColors[2], radius: 2, x: 0, y: 0)

            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(preferences.shirtColors[0])
                .padding(size * 10)
                .frame(width: width, height: height)

            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(preferences.shirtColors[0], lineWidth: 3)
                .padding(size * 10)
                .frame(width: width, height: height)

            Image(systemName: "seal.fill")
                .resizable()
                .frame(width: size * 20, height: size * 20)
                .foregroundColor(preferences.shirtColors[0])

            Image(systemName: "seal")
                .resizable()
                .frame(width: size * 40, height: size * 40)
                .foregroundColor(preferences.shirtColors[3])

            Image(systemName: "seal")
                .resizable()
                .frame(width: size * 70, height: size * 70)
                .foregroundColor(preferences.shirtColors[0])

        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))

    }
}

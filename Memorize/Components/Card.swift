import SwiftUI

struct CardFront : View {
    let size : CGFloat
    let icon: String
    @Binding var degree : Double

    var body: some View {
        ZStack {
            let width = size * 100
            let height = size * 125
            
            RoundedRectangle(cornerRadius: size * 10)
                .fill(.white)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            let uiImage = icon.image()!
            Image(uiImage: uiImage)
                .resizable()
                .frame(width: size * 60, height: size * 70)
                .foregroundColor(.red)

        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardBack : View {
    let size : CGFloat
    @Binding var degree : Double

    var body: some View {
        ZStack {
            let width = size * 100
            let height = size * 125
            let cornerRadius = size * 10
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(.blue.opacity(0.7), lineWidth: 3)
                .frame(width: width, height: height)

            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(.blue.opacity(0.2))
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)

            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(.blue.opacity(0.7))
                .padding(size * 10)
                .frame(width: width, height: height)

            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(.blue.opacity(0.7), lineWidth: 3)
                .padding(size * 10)
                .frame(width: width, height: height)

            Image(systemName: "seal.fill")
                .resizable()
                .frame(width: size * 20, height: size * 20)
                .foregroundColor(.blue.opacity(0.7))

            Image(systemName: "seal")
                .resizable()
                .frame(width: size * 40, height: size * 40)
                .foregroundColor(.white)

            Image(systemName: "seal")
                .resizable()
                .frame(width: size * 70, height: size * 70)
                .foregroundColor(.blue.opacity(0.7))

        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))

    }
}

struct Card: View {
    
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var isFlipped = false

    var size : CGFloat = 1
    let durationAndDelay : CGFloat = 0.3
    let icon: String

    
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
    
    var body: some View {
        ZStack {
            CardFront(size: size, icon: icon, degree: $frontDegree)
            CardBack(size: size, degree: $backDegree)
        }.onTapGesture {
            flipCard ()
        }
    }
}

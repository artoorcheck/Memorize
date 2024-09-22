import SwiftUI

struct Card: View {
    
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @ObservedObject var cardInfo: CardInfo

    let durationAndDelay : CGFloat = 0.3
    @ObservedObject var preferences: Preference
    @Binding var increment: Int
    
    func flipFaceUpCard () {
        cardInfo.cardState = .faceUp
            
        increment += 1
        withAnimation(.linear(duration: durationAndDelay)) {
            backDegree = 90
        }
        withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
            frontDegree = 0
        }
    }
    
    func flipUserFaceUp(){
        if(increment > 1) {
            return
        }
        flipFaceUpCard()
    }
    
    func flipFaceDownCard () {
        cardInfo.cardState = .faceDown
        withAnimation(.linear(duration: durationAndDelay)) {
            frontDegree = -90
        }
        withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
            backDegree = 0
        }
    }
    
    var body: some View {
        if cardInfo.cardState != .hidden {
            ZStack {
                CardFront(size: preferences.cardSize, icon: cardInfo.icon, degree: $frontDegree, preferences: preferences)
                CardBack(size: preferences.cardSize, degree: $backDegree, preferences: preferences)
            }.onTapGesture {
                flipUserFaceUp()
            }
            .onChange(of: cardInfo.cardState){ newValue in
                if newValue == .faceDown {
                    flipFaceDownCard ()
                }
                else {
                    flipFaceUpCard()
                }
            }
        }
        else {
            CardSpace(size: preferences.cardSize, color: preferences.backGroundColor)
        }
    }
}

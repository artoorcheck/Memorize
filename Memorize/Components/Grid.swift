import SwiftUI

struct Grid: View {
    @ObservedObject var preferences: Preference
    @State var cardCounter = 0
    
    
    var body: some View {
        let emojies = preferences.gridCardInfo
        VStack(spacing: 25*preferences.cardSize){
            ForEach(emojies, id: \.self){row in
                HStack{
                    ForEach(row, id: \.self.id){info in
                        Card(cardInfo: info, preferences: preferences, increment: $cardCounter)
                    }
                }
            }
        }
        .onChange(of: cardCounter){newValue in
            if cardCounter > 1 {
                onFaceUp()
            }
        }
    }
    
    private func isEmptyCardList() -> Bool{
        return preferences.cardSequence.filter{value in
            value.cardState != .hidden
        }
        .isEmpty
    }
    
    private func onFaceUp() {
        let faceUpCards = preferences.cardSequence.filter{value in
            value.cardState == .faceUp
        }
        if faceUpCards.count == cardCounter && faceUpCards.count > 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                cardCounter = 0
                if faceUpCards.count == 2 {
                    if faceUpCards[0].icon == faceUpCards[1].icon {
                        preferences.score += 2
                        faceUpCards[0].cardState = .hidden
                        faceUpCards[1].cardState = .hidden
                        if isEmptyCardList() {
                            preferences.isPlayerWin = true
                            preferences.gameOver = true
                        }
                    }
                    else if faceUpCards[0].isShown || faceUpCards[1].isShown {
                        preferences.score -= 1
                        if preferences.score <= 0{
                            preferences.isPlayerWin = false
                            preferences.gameOver = true
                        }
                    }
                    faceUpCards[0].isShown = true
                    faceUpCards[1].isShown = true
                }
                faceUpCards.forEach{value in
                    if value.cardState != .hidden {
                        value.cardState = .faceDown
                    }
                }
            }
        }
        else {
            cardCounter = faceUpCards.count
        }
    }
}


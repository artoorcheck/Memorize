import SwiftUI

class CardInfo: Hashable, Identifiable, ObservableObject{
    static func == (lhs: CardInfo, rhs: CardInfo) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher){
        return hasher.combine(id.uuidString)
    }
    
    enum CardState{
        case faceUp
        case faceDown
        case hidden
    }
    
    let id = UUID()
    @Published var cardState = CardState.faceDown
    @Published var icon = ""
    @Published var index = 0
    @Published var isShown = false
}

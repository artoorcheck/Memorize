import SwiftUI

struct WinScreen: View {
    @ObservedObject var preferences: Preference
    
    var body: some View {
        VStack(spacing: 30){
            Text(preferences.isPlayerWin ? "Score: \(preferences.score)": "YOU LOSE")
                .padding(20)
                .font(.largeTitle)
            if #available(iOS 15.0, *) {
                Button("NEW GAME") {
                    preferences.shuffle()
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.green)
                .padding(20)
            }
        }
    }
}

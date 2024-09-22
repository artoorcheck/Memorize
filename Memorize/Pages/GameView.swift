import SwiftUI

struct GameView: View {
    @State private var showingSettings = false
    @ObservedObject var preferences: Preference
    
    var body: some View {
        VStack{
            HStack{
                Text("Score: \(preferences.score)")
                    .padding(20)
                Spacer()
                Text("Theme: \(preferences.theme)")
                    .padding(20)
            }
            if !preferences.gameOver{
                Grid(preferences: preferences)
            }
            else {
                WinScreen(preferences: preferences)
            }
            Spacer()
            Group{
                if #available(iOS 15.0, *) {
                    if preferences.showHintButton && !preferences.gameOver {
                        Button("💡") {
                            Task{
                                await showAllCards()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color.green)
                        .padding(20)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
        }
        .navigationBarTitle("Memorize", displayMode: .inline)
        .navigationBarItems(trailing:
                                Button(action: {}, label: {
            NavigationLink(destination: SettingsView(preferences: preferences)){
                Text("Settings")
            }
        }))
        .navigationBarItems(leading:
                                Button(action: {}, label: {
            NavigationLink(destination: RulesView(preferences: preferences)){
                Text("Help")
            }
        }))
        .background(preferences.backGroundColor)
    }
    
    private func showAllCards() async {
        if preferences.showHintButton {
            preferences.showHintButton = false
            preferences.cardSequence.forEach{elem in
                if elem.cardState == .faceDown {
                    elem.cardState = .faceUp
                }
            }
            preferences.score -= 5
            try? await Task.sleep(nanoseconds: 7_000_000_000)
            preferences.cardSequence.forEach{elem in
                if elem.cardState == .faceUp {
                    elem.cardState = .faceDown
                }
            }
        }
    }
}

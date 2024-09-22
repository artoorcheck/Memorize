import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            GameView(preferences: Preference())
        }
    }
}

#Preview {
    ContentView()
}

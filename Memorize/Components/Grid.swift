import SwiftUI

struct Grid: View {
    @ObservedObject var preferences: Preference
    
    var body: some View {
        let emojies = preferences.icons
        VStack{
            ForEach(0..<8){iIndex in
                HStack{
                    ForEach(0..<6){jIndex in
                        Card(size: 0.5, icon: emojies[iIndex*6+jIndex])
                    }
                }
            }
        }
    }
}


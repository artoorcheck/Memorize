import SwiftUI

struct RulesView: View {
    
    @ObservedObject var preferences: Preference
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing:10){
            HStack{
                Spacer()
            }
            Text("1. Click on the card to flip\n" +
                 "2. Remember images on the cards\n" +
                 "3. Find cards with equals images\n" +
                 "4. You can use the hint")
            Spacer()
                
        }
        .background(preferences.backGroundColor)
            .navigationBarTitle("Game Rules",
                                displayMode: .inline)

    }
}

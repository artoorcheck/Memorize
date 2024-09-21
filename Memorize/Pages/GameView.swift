import SwiftUI

struct GameView: View {
    
    @State var score = 10
    @State private var showingSettings = false
    @ObservedObject var preferences: Preference
    
    var body: some View {
        NavigationView
        {
            Group{
                HStack{
                    Text("Score: \(score)")
                        .padding(20)
                    Spacer()
                    Text("Theme: \(preferences.theme)")
                        .padding(20)
                }
                Grid(preferences: preferences)
                Group{
                    if #available(iOS 15.0, *) {
                        Button("💡") {
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color.green)
                        .padding(20)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
            }
            .navigationBarTitle("Memorize",
                                displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {}, label: {
                NavigationLink(destination: SettingsView(preferences: preferences)){
                    Text("Settings")
                }
            }))
            .navigationBarItems(leading:
                                    Button("Help"){
            })
            .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .bottom)
        }
    }
}

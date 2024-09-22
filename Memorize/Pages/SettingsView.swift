import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var preferences: Preference
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing:10, content: {
                Section(header: Text("Themes")){
                    Picker(selection: $preferences.themeIndex, label:
                        Text("Theme")){
                        ForEach(0..<preferences.themes.count){ element in
                            Text(preferences.themes[element])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .background(preferences.shirtColors[0])
                }
                
                Section(header: Text("Complexity")){
                    Picker(selection: $preferences.newComplexityIndex, label:
                        Text("Complexity")){
                        ForEach(0..<preferences.complexities.count){ element in
                            Text(preferences.complexities[element])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .background(preferences.shirtColors[0])
                }
                Spacer()
                Group{
                    if #available(iOS 15.0, *) {
                        Button("Restart") {
                            preferences.shuffle()
                            presentationMode.wrappedValue.dismiss()
                            presentationMode.wrappedValue.dismiss()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color.red)
                        .padding(20)
                    }
                }
                
            })
        .alert("Your progress will be lost", isPresented: $preferences.needShowChangeComplexityAlert ){
            Button("Confirm", role: .destructive){
                preferences.complexityIndex = preferences.newComplexityIndex
                preferences.shuffle()
            }
            Button("Cancel", role: .cancel){
                preferences.newComplexityIndex = preferences.complexityIndex
            }
        }
        .onChange(of: preferences.newComplexityIndex){ newValue in
            if preferences.newComplexityIndex != preferences.complexityIndex {
                preferences.needShowChangeComplexityAlert = true
            }
        }
        .background(preferences.backGroundColor)
            .navigationBarTitle("Settings",
                                displayMode: .inline)

    }
}

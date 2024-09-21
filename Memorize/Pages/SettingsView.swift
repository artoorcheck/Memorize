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
                }
                
                Section(header: Text("Themes")){
                    Picker(selection: $preferences.themeIndex, label:
                        Text("Theme")){
                        ForEach(0..<preferences.themes.count){ element in
                            Text(preferences.themes[element])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Spacer()
                Group{
                    if #available(iOS 15.0, *) {
                        Button("Restart") {
                            preferences.shuffle()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color.red)
                        .padding(20)
                    }
                }
                
            })
            .navigationBarTitle("Settings",
                                displayMode: .inline)

    }
}

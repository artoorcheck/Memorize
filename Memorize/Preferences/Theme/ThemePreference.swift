import SwiftUI

class ThemePreference: ObservableObject{
    
    let themesData = [
        Theme(
            backGroundColor: .black.opacity(0.5),
            shirtColor: [.black.opacity(0.7), .black.opacity(0.2), .gray, .white],
            emojies: ["😈", "👹", "👺", "🤡", "💩", "👻", "☠️", "👽", "👾", "🤖", "🎃", "🤬", "🦾", "🫀", "🦷", "🧠", "👁️", "👣", "🫁", "🪰", "🕷️", "🦂", "🕸️", "🐍", "🪳"]),
        Theme(
            backGroundColor: .white,
            shirtColor: [.blue.opacity(0.7), .blue.opacity(0.2), .gray, .white],
            emojies: ["😄", "🥹", "😅", "😎", "🥰", "😭", "😬", "😦", "😳", "😱", "😤", "🤓", "🥸", "🤪", "😋", "🙃", "🤕", "😵‍💫", "🤐", "🤒", "😷", "🤑", "🤧", "🤮", "🤠"]),
        Theme(
            backGroundColor: .orange.opacity(0.5),
            shirtColor: [.red.opacity(0.7), .red.opacity(0.2), .orange, .yellow],
            emojies: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐣", "🪿", "🦉", "🦇", "🦄", "🐝", "🐬", "🦚"])
    ]
}

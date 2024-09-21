//
//  Preference.swift
//  Memorize
//
//  Created by Arthur on 21.09.2024.
//

import SwiftUI

class Preference: ObservableObject{
    
    let themes = ["Dark", "Light", "Red"]
    let themePreference = ThemePreference()
    let gridPreference = [
        GridPreference(
            portret: CGVector(dx: 3, dy: 4),
            landscape: CGVector(dx: 8, dy: 2),
            cardSize: 1
        ),
        GridPreference(
            portret: CGVector(dx: 4, dy: 6),
            landscape: CGVector(dx: 8, dy: 3),
            cardSize: 0.75
        ),
        GridPreference(
            portret: CGVector(dx: 6, dy: 8),
            landscape: CGVector(dx: 12, dy: 4),
            cardSize: 0.5
        )
    ]
    
    
    @Published var showingSettings = false
    
    @Published var themeIndex = 0
    @Published var cardSequence = Array(0..<48)
        .map { elem in
            Int(elem / 2)
        }
    
    var icons: [String] {
        return cardSequence.map{
            themePreference.themesData[themeIndex].emojies[$0]
        }
    }
    
    var backGroundColor: Color {
        return themePreference.themesData[themeIndex].backGroundColor
    }
    
    var shirtColors: [Color] {
        return themePreference.themesData[themeIndex].shirtColor
    }
    
    var theme: String {
        return themes[themeIndex]
    }
    
    func shuffle(){
        cardSequence.shuffle()
    }
}

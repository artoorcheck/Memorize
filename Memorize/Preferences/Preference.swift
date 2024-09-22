//
//  Preference.swift
//  Memorize
//
//  Created by Arthur on 21.09.2024.
//

import SwiftUI

class Preference: ObservableObject{

    enum Orientation {
        case portrait
        case landscape
    }
    
    let themes = ["Dark", "Light", "Red"]
    let themePreference = ThemePreference()
    
    let complexities = ["8 pairs", "12 pairs", "24 pairs"]
    let gridPreference = GridPreference()
    
    @Published var orientation: Orientation
    
    @Published var showingSettings = false
    @Published var showHintButton = true
    @Published var needShowChangeComplexityAlert = false
    
    @Published var themeIndex = Int.random(in: 0..<3)
    @Published var score = 10
    @Published var gameOver = false
    @Published var isPlayerWin = false
    
    @Published var cardSequence: [CardInfo] = Array(0..<24)
        .map { elem in
            let cardInfo = CardInfo()
            cardInfo.index = Int(elem / 2)
            return cardInfo
        }
        .shuffled()
    
    
    @Published var complexityIndex = 1
    @Published var newComplexityIndex = 1
    
    private var _observer: NSObjectProtocol?
    
    init()
    {
        // fairly arbitrary starting value for 'flat' orientations
        if UIDevice.current.orientation.isLandscape {
            self.orientation = .landscape
        } else {
            self.orientation = .portrait
        }
        
        // unowned self because we unregister before self becomes invalid
        _observer = NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: nil) {
            [unowned self] note in guard let device = note.object as? UIDevice
            else {
                return
            }
            if device.orientation.isPortrait {
                self.orientation = .portrait
                print("portret")
            } else if device.orientation.isLandscape {
                self.orientation = .landscape
                print("landscape")
            }
        }
    }
        deinit {
            if let observer = _observer { NotificationCenter.default.removeObserver(observer)
        }
    }
    
    var gridCardInfo: [[CardInfo]] {
        var gridSize = gridPreference.presets[complexityIndex].portret
        if orientation == .landscape {
            gridSize = gridPreference.presets[complexityIndex].landscape
        }
        let vCount = Int(gridSize.dy)
        let hCount = Int(gridSize.dx)
        print("x:\(hCount), y:\(vCount)")
        
        
        return Array(0..<vCount).map{iIndex in
            Array(0..<hCount)
                .map{jIndex in
                    let cardInfo = cardSequence[iIndex*hCount + jIndex]
                    cardInfo.icon = themePreference.themesData[themeIndex]
                        .emojies[cardInfo.index]
                    return cardInfo
            }
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
        score = 10
        gameOver = false
        showHintButton = true
        cardSequence = Array(0..<gridPreference.presets[complexityIndex].pairCount*2)
            .map { elem in
                let cardInfo = CardInfo()
                cardInfo.index = Int(elem / 2)
                return cardInfo
            }
            .shuffled()
    }
    
    var cardSize: CGFloat{
        return gridPreference.presets[complexityIndex].cardSize
    }
}

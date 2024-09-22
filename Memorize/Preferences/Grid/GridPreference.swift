import SwiftUI

struct GridPreference{
    let presets = [
        ComplexityPreset(
            portret: CGVector(dx: 4, dy: 4),
            landscape: CGVector(dx: 8, dy: 2),
            cardSize: 0.8,
            pairCount: 8
        ),
        ComplexityPreset(
            portret: CGVector(dx: 4, dy: 6),
            landscape: CGVector(dx: 8, dy: 3),
            cardSize: 0.5,
            pairCount: 12
        ),
        ComplexityPreset(
            portret: CGVector(dx: 6, dy: 8),
            landscape: CGVector(dx: 12, dy: 4),
            cardSize: 0.4,
            pairCount: 24
        )
    ]
}

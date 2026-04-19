//
//  ConfettiConfiguration.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/15/26.
//

import UIKit

// MARK: - Presets

public enum Confetti {
    @MainActor public static let `default`: ConfettiGenerator = Shower()
    
    @MainActor public static let leftCannon: ConfettiGenerator = LeftCannon()
    
    @MainActor public static let fountain: ConfettiGenerator = Fountain()
    
    /// Override properties of a preset `Confetti` instance.
    @MainActor public static func override(
        confetti: ConfettiGenerator,
        images: [UIImage]? = nil,
        intensity: Confetti.Intensity? = nil
    ) -> ConfettiGenerator {
        var _confetti = confetti
        _confetti.images = images ?? _confetti.images
        _confetti.intensity = intensity ?? _confetti.intensity
        return _confetti
    }
}

// MARK: - Intensity

public extension Confetti {
    enum Intensity: Double, Sendable {
        case extraLow = 0.2
        case low = 0.3
        case medium = 0.5
        case high = 1.0
        case extraHigh = 1.2
        
        var multiplier: Float {
            Float(rawValue)
        }
    }
}

// MARK: - Assets

extension Confetti {
    enum Assets {
        static let allImages: [UIImage] = [
            UIImage(resource: .i1),
            UIImage(resource: .i2),
            UIImage(resource: .i3),
            UIImage(resource: .i4),
            UIImage(resource: .i5),
            UIImage(resource: .i6),
            UIImage(resource: .i7),
            UIImage(resource: .i8)
        ]
        
        static let waterImages: [UIImage] = [
            UIImage(resource: .water1),
            UIImage(resource: .water2),
            UIImage(resource: .water3),
            UIImage(resource: .water4)
        ]
    }
}

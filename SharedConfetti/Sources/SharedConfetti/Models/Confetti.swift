//
//  ConfettiConfiguration.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/15/26.
//

import UIKit

// MARK: - Presets

public enum Confetti {
    public enum Configuration {
        case `default`
        case leftCannon
        case fountain
    }
}

internal extension Confetti.Configuration {
    func makeConfiguration() -> ConfettiGenerator {
        switch self {
        case .default: Shower()
        case .leftCannon: LeftCannon()
        case .fountain: Fountain()
        }
    }
}

// MARK: - Intensity

public extension Confetti {
    enum Intensity: Double {
        case lowx = 0.7
        case lowxx = 0.8
        case lowxxx = 0.9
        case normal = 1.0
        case highx = 1.1
        case highxx = 1.2
        case highxxx = 1.3
        
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

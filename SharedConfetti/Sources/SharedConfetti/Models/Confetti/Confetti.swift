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

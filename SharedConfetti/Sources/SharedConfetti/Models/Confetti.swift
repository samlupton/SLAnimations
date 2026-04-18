//
//  ConfettiConfiguration.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/15/26.
//

import UIKit

@MainActor
public struct Confetti {
    public var images: [UIImage]
    public var generator: any ConfettiGenerator
}

// MARK: - Presets

public extension Confetti {
    static let `default`: Self = .init(
        images: [
            UIImage(resource: .i1),
            UIImage(resource: .i2),
            UIImage(resource: .i3),
            UIImage(resource: .i4),
            UIImage(resource: .i5)
        ],
        generator: Shower()
    )
}

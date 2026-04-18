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
            .init(resource: .i1),
            .init(resource: .i2),
            .init(resource: .i3),
            .init(resource: .i4),
            .init(resource: .i5)
        ],
        generator: LeftCannon()
    )
}

//
//  Confetti+Emission.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Confetti.Cell {
    struct Emission: Sendable {
        var latitude: CGFloat = .zero
        var longitude: CGFloat = .zero
        var range: CGFloat = .zero
    }
}

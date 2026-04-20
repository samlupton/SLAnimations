//
//  Confetti+Scale.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Confetti.Cell {
    struct Scale: Sendable {
        var base: CGFloat
        var range: CGFloat
        var speed: CGFloat = 0
    }
}

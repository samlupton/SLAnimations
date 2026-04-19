//
//  Confetti+Scale.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Confetti.Cell {
    struct Scale {
        var base: CGFloat
        var variation: CGFloat
        var speed: CGFloat = 0
    }
}

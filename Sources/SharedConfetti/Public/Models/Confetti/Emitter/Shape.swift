//
//  Emitter+Shape.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/20/26.
//

import QuartzCore

public extension Confetti.Emitter {
    enum Shape: Sendable {
        case point, line, rectangle, circle
    }
}

//
//  Confetti+Emitter.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/20/26.
//

import CoreFoundation

public extension Confetti {
    struct Emitter: Sendable {
        var geometry: Confetti.Emitter.Geometry
        var shape: Confetti.Emitter.Shape
        var mode: Confetti.Emitter.Mode
        var cells: [Cell]
    }
}

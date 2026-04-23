//
//  Emitter+Mode.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/20/26.
//

import QuartzCore

public extension Confetti.Emitter {
    enum Mode: Sendable {
        case points, outline, surface, volume
    }
}

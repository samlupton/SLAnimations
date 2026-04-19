//
//  Confetti+Cell.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Confetti {
    struct Cell {
        let spin: Spin
        let scale: Scale
        let acceleration: Acceleration
        let velocity: Velocity
        let emission: Emission
        let contents: Contents
    }
}

//
//  Confetti+Cell.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/19/26.
//

public extension Confetti {
    struct Cell: Sendable {
        let lifetime: Lifetime
        let spin: Spin
        let scale: Scale
        let acceleration: Acceleration
        let velocity: Velocity
        let emission: Emission
        let contents: Contents
    }
}

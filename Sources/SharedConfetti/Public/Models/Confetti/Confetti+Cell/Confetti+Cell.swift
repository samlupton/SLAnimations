//
//  Confetti+Cell.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/19/26.
//

public extension Confetti {
    struct Cell: Sendable {
        internal let lifetime: Lifetime
        internal let spin: Spin
        internal let scale: Scale
        internal let acceleration: Acceleration
        internal let velocity: Velocity
        internal let emission: Emission
        internal let contents: Contents
        
        public init(
            lifetime: Lifetime,
            spin: Spin,
            scale: Scale,
            acceleration: Acceleration,
            velocity: Velocity,
            emission: Emission,
            contents: Contents
        ) {
            self.lifetime = lifetime
            self.spin = spin
            self.scale = scale
            self.acceleration = acceleration
            self.velocity = velocity
            self.emission = emission
            self.contents = contents
        }
    }
}

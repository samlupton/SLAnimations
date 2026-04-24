//
//  Plume+Cell.swift
//  SharedPlume
//
//  Created by Samuel Lupton on 4/19/26.
//

public extension Plume {
    struct Cell: Sendable {
        let lifetime: Lifetime
        let spin: Spin
        let scale: Scale
        let acceleration: Acceleration
        let velocity: Velocity
        let emission: Emission
        let contents: Contents
        
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

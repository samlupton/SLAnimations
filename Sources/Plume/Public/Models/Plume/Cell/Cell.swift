//
//  Plume+Cell.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

public extension Plume {
    struct Cell: Sendable {
        public var lifetime: Lifetime
        public var spin: Spin
        public var scale: Scale
        public var acceleration: Acceleration
        public var velocity: Velocity
        public var emission: Emission
        public var contents: Contents
        
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

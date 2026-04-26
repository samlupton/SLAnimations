//
//  Plume+Cell.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

extension Plume {
    public struct Cell: Sendable {
        public var contents: Contents
        public var lifetime: Lifetime
        public var spin: Spin
        public var scale: Scale
        public var acceleration: Acceleration
        public var velocity: Velocity
        public var angle: Angle
        
        public init(
            contents: Contents,
            lifetime: Lifetime,
            spin: Spin,
            scale: Scale,
            acceleration: Acceleration,
            velocity: Velocity,
            angle: Angle
        ) {
            self.contents = contents
            self.lifetime = lifetime
            self.spin = spin
            self.scale = scale
            self.acceleration = acceleration
            self.velocity = velocity
            self.angle = angle
        }
    }
}

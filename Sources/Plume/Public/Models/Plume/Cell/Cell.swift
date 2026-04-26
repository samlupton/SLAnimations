//
//  Plume+Cell.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

extension Plume {
    public struct Cell: Sendable {
        public var contents: Plume.Cell.Contents
        public var lifetime: Plume.Cell.Lifetime
        public var spin: Plume.Cell.Spin
        public var scale: Plume.Cell.Scale
        public var acceleration: Plume.Cell.Acceleration
        public var velocity: Plume.Cell.Velocity
        public var angle: Plume.Cell.Angle
        
        public init(
            contents: Plume.Cell.Contents,
            lifetime: Plume.Cell.Lifetime,
            spin: Plume.Cell.Spin,
            scale: Plume.Cell.Scale,
            acceleration: Plume.Cell.Acceleration,
            velocity: Plume.Cell.Velocity,
            angle: Plume.Cell.Angle
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

//
//  Plume+Acceleration.swift
//  SharedPlume
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Plume.Cell {
    struct Acceleration: Sendable {
        let x: CGFloat
        let y: CGFloat
        let z: CGFloat
        
        public init(x: CGFloat = .zero, y: CGFloat = .zero, z: CGFloat = .zero) {
            self.x = x
            self.y = y
            self.z = z
        }
    }
}

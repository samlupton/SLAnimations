//
//  Confetti+Acceleration.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Confetti.Cell {
    public struct Acceleration: Sendable {
        var x: CGFloat
        var y: CGFloat
        var z: CGFloat
        
        public init(x: CGFloat = .zero, y: CGFloat = .zero, z: CGFloat = .zero) {
            self.x = x
            self.y = y
            self.z = z
        }
    }
}

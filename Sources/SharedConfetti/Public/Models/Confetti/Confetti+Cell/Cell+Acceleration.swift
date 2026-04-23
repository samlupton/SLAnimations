//
//  Confetti+Acceleration.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Confetti.Cell {
    struct Acceleration: Sendable {
        internal let x: CGFloat
        internal let y: CGFloat
        internal let z: CGFloat
        
        public init(x: CGFloat = .zero, y: CGFloat = .zero, z: CGFloat = .zero) {
            self.x = x
            self.y = y
            self.z = z
        }
    }
}

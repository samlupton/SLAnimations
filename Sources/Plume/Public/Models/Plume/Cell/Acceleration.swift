//
//  Plume+Acceleration.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Plume.Cell {
    struct Acceleration: Sendable {
        public var x: CGFloat
        public var y: CGFloat
        
        internal init(x: CGFloat, y: CGFloat) {
            self.x = x
            self.y = y
        }
    }
}

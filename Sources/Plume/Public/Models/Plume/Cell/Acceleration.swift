//
//  Acceleration.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

extension Plume.Cell {
    /// Defines the horizontal and vertical acceleration applied to a particle over time.
    public struct Acceleration: Sendable {
        /// Horizontal acceleration.
        let x: CGFloat

        /// Vertical acceleration.
        let y: CGFloat
        
        internal init(x: CGFloat, y: CGFloat) {
            self.x = x
            self.y = y
        }
    }
}

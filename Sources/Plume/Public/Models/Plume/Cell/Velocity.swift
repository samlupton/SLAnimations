//
//  Velocity.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

extension Plume.Cell {
    /// Defines the initial speed of a particle and its speed variance.
    public struct Velocity: Sendable {
        /// The base velocity applied at emission time.
        let base: CGFloat

        /// The amount of velocity variance applied to each particle.
        let range: CGFloat
        
        internal init(base: CGFloat, range: CGFloat) {
            self.base = base
            self.range = range
        }
    }
}

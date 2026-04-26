//
//  Plume+Scale.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

extension Plume.Cell {
    /// Defines the particle size and size variance.
    public struct Scale: Sendable {
        /// The base rendered scale of the particle.
        let base: CGFloat

        /// The amount of scale variance applied to each particle.
        let range: CGFloat
        
        internal init(base: CGFloat, range: CGFloat) {
            self.base = base
            self.range = range
        }
    }
}

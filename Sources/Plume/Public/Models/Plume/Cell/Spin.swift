//
//  Plume+Spin.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

extension Plume.Cell {
    /// Defines the rotational speed and rotational variance of a particle.
    public struct Spin: Sendable {
        /// The base spin value applied to the particle.
        let base: CGFloat

        /// The amount of spin variance applied to each particle.
        let range: CGFloat
        
        internal init(base: CGFloat, range: CGFloat) {
            self.base = base
            self.range = range
        }
    }
}

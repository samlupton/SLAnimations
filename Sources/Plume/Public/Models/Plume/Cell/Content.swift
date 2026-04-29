//
//  Content.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

extension Plume.Cell {
    /// Encapsulates the image used to render a particle.
    internal struct Contents: Sendable {
        /// The backing Core Graphics image used by the emitter cell.
        let image: CGImage?
        
        /// Creates particle contents from a Core Graphics image.
        ///
        /// - Parameter cgimage: The image used to render the particle.
        internal init(cgimage: CGImage) {
            self.image = cgimage
        }
        
    }
}

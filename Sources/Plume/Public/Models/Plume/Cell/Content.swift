//
//  Content.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

import UIKit

extension Plume.Cell {
    /// Encapsulates the image used to render a particle.
    public struct Contents: Sendable {
        /// The backing Core Graphics image used by the emitter cell.
        let image: CGImage?
        
        /// Creates particle contents from a Core Graphics image.
        ///
        /// - Parameter cgimage: The image used to render the particle.
        internal init(cgimage: CGImage) {
            self.image = cgimage
        }
        
        /// Creates particle contents from a UIKit image.
        ///
        /// - Parameter uiimage: The image used to render the particle.
        internal init(uiimage: UIImage) {
            self.image = uiimage.cgImage
        }
        
        @available(iOS 17.0, *)
        /// Creates particle contents from an asset catalog image resource.
        ///
        /// - Parameter resource: The image resource used to render the particle.
        internal init(resource: ImageResource) {
            self.image = UIImage(resource: resource).cgImage
        }
    }
}

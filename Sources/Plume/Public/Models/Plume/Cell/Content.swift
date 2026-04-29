//
//  Content.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

#if canImport(UIKit)
import UIKit
#endif

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
        
        #if canImport(UIKit)
        /// Creates particle contents from a UIKit image.
        ///
        /// - Parameter uiimage: The image used to render the particle.
        internal init(uiimage: UIImage) {
            self.image = uiimage.cgImage
        }
        #endif
    
        @available(iOS 17.0, *)
        /// Creates particle contents from an asset catalog image resource.
        ///
        /// - Parameter resource: The image resource used to render the particle.
        internal init(resource: ImageResource) {
            self.image = UIImage(resource: resource).cgImage
        }
    }
}

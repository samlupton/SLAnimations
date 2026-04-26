//
//  Plume+Content.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics
import UIKit

extension Plume.Cell {
    public struct Contents: Sendable {
        public var image: CGImage?
        
        public init(cgimage: CGImage) {
            self.image = cgimage
        }
        
        public init(uiimage: UIImage) {
            self.image = uiimage.cgImage
        }
        
        @available(iOS 17.0, *)
        public init(resource: ImageResource) {
            self.image = UIImage(resource: resource).cgImage
        }
    }
}

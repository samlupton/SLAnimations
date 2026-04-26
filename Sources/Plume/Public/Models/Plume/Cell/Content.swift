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
        public var scale: CGFloat
        
        public init(cgimage: CGImage, scale: CGFloat = 1) {
            self.image = cgimage
            self.scale = scale
        }
        
        public init(uiimage: UIImage, scale: CGFloat = 1) {
            self.image = uiimage.cgImage
            self.scale = scale
        }
        
        @available(iOS 17.0, *)
        public init(resource: ImageResource, scale: CGFloat = 1) {
            self.image = UIImage(resource: resource).cgImage
            self.scale = scale
        }
    }
}

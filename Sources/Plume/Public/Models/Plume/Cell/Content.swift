//
//  Plume+Content.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics
import UIKit
import SwiftUI

public extension Plume.Cell {
    struct Contents: Sendable {
        public var image: CGImage?
        public var rect: CGRect
        public var scale: CGFloat
        
        public init(
            cgimage: CGImage,
            rect: CGRect = .init(x: 0, y: 0, width: 1, height: 1),
            scale: CGFloat = 1
        ) {
            self.image = cgimage
            self.rect = rect
            self.scale = scale
        }
        
        public init(
            uiimage: UIImage,
            rect: CGRect = .init(x: 0, y: 0, width: 1, height: 1),
            scale: CGFloat = 1
        ) {
            self.image = uiimage.cgImage
            self.rect = rect
            self.scale = scale
        }
        
        @available(iOS 17.0, *)
        public init(
            resource: ImageResource,
            rect: CGRect = .init(x: 0, y: 0, width: 1, height: 1),
            scale: CGFloat = 1
        ) {
            self.image = UIImage(resource: resource).cgImage
            self.rect = rect
            self.scale = scale
        }
    }
}

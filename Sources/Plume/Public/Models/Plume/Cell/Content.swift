//
//  Plume+Content.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Plume.Cell {
    struct Contents: Sendable {
        public var image: CGImage?
        public var rect: CGRect
        public var scale: CGFloat
        
        public init(
            image: CGImage,
            rect: CGRect = .init(x: 0, y: 0, width: 1, height: 1),
            scale: CGFloat = 1
        ) {
            self.image = image
            self.rect = rect
            self.scale = scale
        }
    }
}

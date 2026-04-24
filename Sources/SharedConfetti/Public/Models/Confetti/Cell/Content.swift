//
//  Confetti+Content.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Confetti.Cell {
    struct Contents: Sendable {
        let image: CGImage?
        let rect: CGRect
        let scale: CGFloat
        
        public init(
            image: CGImage? = nil,
            rect: CGRect = .init(x: 0, y: 0, width: 1, height: 1),
            scale: CGFloat = 1
        ) {
            self.image = image
            self.rect = rect
            self.scale = scale
        }
    }
}

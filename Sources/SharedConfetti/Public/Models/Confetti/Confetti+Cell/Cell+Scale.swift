//
//  Confetti+Scale.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Confetti.Cell {
    struct Scale: Sendable {
        let base: CGFloat
        let range: CGFloat
        let speed: CGFloat
        
        public init(base: CGFloat,range: CGFloat, speed: CGFloat = 0) {
            self.base = base
            self.range = range
            self.speed = speed
        }
    }
}

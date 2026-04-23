//
//  Confetti+Spin.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Confetti.Cell {
    struct Spin: Sendable {
        let base: CGFloat
        let range: CGFloat
        
        public init(base: CGFloat, range: CGFloat) {
            self.base = base
            self.range = range
        }
    }
}

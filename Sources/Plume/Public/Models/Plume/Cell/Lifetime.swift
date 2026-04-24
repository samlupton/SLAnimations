//
//  Plume+Lifetime.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Plume.Cell {
    struct Lifetime: Sendable {
        public var birthRate: CGFloat
        public var base: CGFloat
        public var range: CGFloat
        
        public init(birthRate: CGFloat, base: CGFloat, range: CGFloat) {
            self.birthRate = birthRate
            self.base = base
            self.range = range
        }
    }
}

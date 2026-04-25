//
//  Plume+Scale.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Plume.Cell {
    struct Scale: Sendable {
        public var base: CGFloat
        public var range: CGFloat
        public var speed: CGFloat
        
        public init(base: CGFloat, range: CGFloat = .zero, speed: CGFloat = .zero) {
            self.base = base
            self.range = range
            self.speed = speed
        }
    }
}

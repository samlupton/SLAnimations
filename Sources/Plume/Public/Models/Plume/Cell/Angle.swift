//
//  Plume+Angle.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Plume.Cell {
    struct Angle: Sendable {
        public var base: CGFloat
        public var range: CGFloat
        
        public init(base: CGFloat = .zero, range: CGFloat = .zero) {
            self.base = base
            self.range = range
        }
    }
}

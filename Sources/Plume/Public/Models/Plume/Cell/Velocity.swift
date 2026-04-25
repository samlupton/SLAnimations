//
//  Plume+Velocity.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Plume.Cell {
    struct Velocity: Sendable {
        public var base: CGFloat
        public var range: CGFloat
        
        public init(base: CGFloat, range: CGFloat = .zero) {
            self.base = base
            self.range = range
        }
    }
}

public extension Plume.Cell.Velocity {
    static let none: Self = .init(base: 0)
    static let slow: Self = .init(base: 30, range: 10)
    static let normal: Self = .init(base: 100, range: 30)
    static let fast: Self = .init(base: 200, range: 50)
    static let burst: Self = .init(base: 400, range: 100)
}

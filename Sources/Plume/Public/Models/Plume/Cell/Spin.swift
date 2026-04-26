//
//  Plume+Spin.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Plume.Cell {
    struct Spin: Sendable {
        let base: CGFloat
        let range: CGFloat
        
        internal init(base: CGFloat, range: CGFloat) {
            self.base = base
            self.range = range
        }
    }
}

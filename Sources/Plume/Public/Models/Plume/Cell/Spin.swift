//
//  Plume+Spin.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

extension Plume.Cell {
    public struct Spin: Sendable {
        let base: CGFloat
        let range: CGFloat
        
        internal init(base: CGFloat, range: CGFloat) {
            self.base = base
            self.range = range
        }
    }
}

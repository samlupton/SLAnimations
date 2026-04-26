//
//  Plume+Acceleration.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

extension Plume.Cell {
    public struct Acceleration: Sendable {
        let x: CGFloat
        let y: CGFloat
        
        internal init(x: CGFloat, y: CGFloat) {
            self.x = x
            self.y = y
        }
    }
}

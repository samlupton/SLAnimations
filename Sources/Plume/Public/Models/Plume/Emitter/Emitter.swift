//
//  Plume+Emitter.swift
//  Plume
//
//  Created by Samuel Lupton on 4/20/26.
//

import CoreGraphics

public extension Plume {
    struct Emitter: Sendable {
        let shape: Plume.Emitter.Shape
        let mode: Plume.Emitter.Mode
        let birthRate: CGFloat
        
        internal init(
            shape: Plume.Emitter.Shape,
            mode: Plume.Emitter.Mode,
            birthRate: CGFloat
        ) {
            self.shape = shape
            self.mode = mode
            self.birthRate = birthRate
        }
    }
}

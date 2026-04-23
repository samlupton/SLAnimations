//
//  Confetti+Emitter.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/20/26.
//

import CoreFoundation

public extension Confetti {
    public struct Emitter: Sendable {
        var geometry: Confetti.Emitter.Geometry
        var shape: Confetti.Emitter.Shape
        var mode: Confetti.Emitter.Mode
        var cells: [Cell]
        
        public init(
            geometry: Confetti.Emitter.Geometry,
            shape: Confetti.Emitter.Shape,
            mode: Confetti.Emitter.Mode,
            cells: [Cell]
        ) {
            self.geometry = geometry
            self.shape = shape
            self.mode = mode
            self.cells = cells
        }
    }
}

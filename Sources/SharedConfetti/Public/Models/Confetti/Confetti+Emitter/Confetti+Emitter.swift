//
//  Confetti+Emitter.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/20/26.
//

import CoreFoundation

public extension Confetti {
    struct Emitter: Sendable {
        internal let geometry: Confetti.Emitter.Geometry
        internal let shape: Confetti.Emitter.Shape
        internal let mode: Confetti.Emitter.Mode
        internal let cells: [Cell]
        
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

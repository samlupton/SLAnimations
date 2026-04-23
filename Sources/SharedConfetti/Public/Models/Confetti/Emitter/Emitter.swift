//
//  Confetti+Emitter.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/20/26.
//

import CoreFoundation

public extension Confetti {
    struct Emitter: Sendable {
        let geometry: Confetti.Emitter.Geometry
        let shape: Confetti.Emitter.Shape
        let mode: Confetti.Emitter.Mode
//        let cells: [Cell]
        
        public init(
            geometry: Confetti.Emitter.Geometry,
            shape: Confetti.Emitter.Shape,
            mode: Confetti.Emitter.Mode,
//            cells: [Cell]
        ) {
            self.geometry = geometry
            self.shape = shape
            self.mode = mode
//            self.cells = cells
        }
    }
}

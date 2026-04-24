//
//  Confetti+Emitter.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/20/26.
//

public extension Confetti {
    struct Emitter: Sendable {
        let shape: Confetti.Emitter.Shape
        let mode: Confetti.Emitter.Mode
        
        public init(
            shape: Confetti.Emitter.Shape,
            mode: Confetti.Emitter.Mode
        ) {
            self.shape = shape
            self.mode = mode
        }
    }
}

//
//  ConfettiConfiguration.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/15/26.
//

import CoreFoundation

public extension Confetti {
    struct Configuration: Sendable {
        let emitter: Emitter
        let cells: [Cell]
        
        public init(emitter: Emitter, cells: [Cell]) {
            self.emitter = emitter
            self.cells = cells
        }
    }
}

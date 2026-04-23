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
        
        public init(emitter: Emitter) {
            self.emitter = emitter
        }
    }
}

//
//  ConfettiConfiguration.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/15/26.
//

import CoreFoundation

public extension Confetti {
    struct Configuration: Sendable {
        internal let emitter: Emitter
        internal let opacity: Float
        
        public init(emitter: Emitter, opacity: Float = 1) {
            self.emitter = emitter
            self.opacity = opacity
        }
    }
}

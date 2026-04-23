//
//  Emitter+Geometry.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/20/26.
//

import CoreFoundation

public extension Confetti.Emitter {
    struct Geometry: Sendable {
        internal let position: CGPoint
        internal let size: CGSize
        
        public init(position: CGPoint, size: CGSize) {
            self.position = position
            self.size = size
        }
        
        public init(rect: CGRect) {
            self.position = rect.origin
            self.size = rect.size
        }
    }
}

//
//  Confetti+Lifetime.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/19/26.
//

public extension Confetti.Cell {
    struct Lifetime: Sendable {
        let birthRate: Float
        let base: Float
        let range: Float
        
        public init(birthRate: Float, base: Float, range: Float) {
            self.birthRate = birthRate
            self.base = base
            self.range = range
        }
    }
}

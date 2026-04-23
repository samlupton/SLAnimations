//
//  Confetti+Emission.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Confetti.Cell {
    struct Emission: Sendable {
        internal let latitude: CGFloat
        internal let longitude: CGFloat
        internal let range: CGFloat
        
        public init(
            latitude: CGFloat = .zero,
            longitude: CGFloat = .zero,
            range: CGFloat = .zero
        ) {
            self.latitude = latitude
            self.longitude = longitude
            self.range = range
        }
    }
}

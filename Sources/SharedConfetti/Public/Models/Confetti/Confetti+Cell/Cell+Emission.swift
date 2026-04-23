//
//  Confetti+Emission.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Confetti.Cell {
    public struct Emission: Sendable {
        var latitude: CGFloat
        var longitude: CGFloat
        var range: CGFloat
        
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

//
//  Plume+Emission.swift
//  SharedPlume
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Plume.Cell {
    struct Emission: Sendable {
        let latitude: CGFloat
        let longitude: CGFloat
        let range: CGFloat
        
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

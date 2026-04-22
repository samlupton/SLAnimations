//
//  Confetti+Content.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Confetti.Cell {
    struct Contents: Sendable {
        var image: CGImage?
        var rect: CGRect = .init(x: 0, y: 0, width: 1, height: 1)
        var scale: CGFloat = 1
    }
}

//
//  Confetti+Contents.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Confetti.Cell {
    struct Contents {
        var image: CGImage?
        var rect: CGRect = .zero
        var scale: CGFloat = 1
    }
}

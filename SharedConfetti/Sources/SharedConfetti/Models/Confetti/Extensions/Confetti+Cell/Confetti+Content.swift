//
//  Confetti+Content.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Confetti.Cell {
    struct Content: Sendable {
        var image: CGImage?
        var rect: CGRect = .init(x: 0, y: 0, width: 1, height: 1)
        var scale: CGFloat = 1
    }
}

extension Confetti.Cell.Content {
    internal static func shower() -> [Confetti.Cell.Content] {
        let images = Confetti.Assets.makeShower()
        return images.map {
            Confetti.Cell.Content(image: $0)
        }
    }
    
    internal static func fountain() -> [Confetti.Cell.Content] {
        let images = Confetti.Assets.makeFountain()
        return images.map {
            Confetti.Cell.Content(image: $0)
        }
    }
}

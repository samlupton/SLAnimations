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

extension Confetti.Cell.Contents {
    internal static func makeFountainContents() -> [Confetti.Cell.Contents] {
        let images = Confetti.Assets.makeFountainAssets()
        return images.map {
            Confetti.Cell.Contents(image: $0)
        }
    }
    
    internal static func makeShowerContents() -> [Confetti.Cell.Contents] {
        let images = Confetti.Assets.makeShowerAssets()
        return images.map {
            Confetti.Cell.Contents(image: $0)
        }
    }
    
    internal static func makeLeftCannonContents() -> [Confetti.Cell.Contents] {
        let images = Confetti.Assets.makeCannonsAssets()
        return images.map {
            Confetti.Cell.Contents(image: $0)
        }
    }
    
    internal static func makeRightCannonContents() -> [Confetti.Cell.Contents] {
        let images = Confetti.Assets.makeCannonsAssets()
        return images.map {
            Confetti.Cell.Contents(image: $0)
        }
    }
}

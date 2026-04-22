//
//  Confetti+Cell+Contents.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 4/22/26.
//

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

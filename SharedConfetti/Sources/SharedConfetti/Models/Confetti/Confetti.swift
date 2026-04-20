//
//  ConfettiConfiguration.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/15/26.
//

import UIKit

public enum Confetti {
    public struct Configuration: @unchecked Sendable {
        let cells: [Cell]
    }
}

public extension Confetti.Configuration {
    static let shower: Self = makeShower(with: Confetti.Cell.Content.shower())
    static let fountain: Self = makeShower(with: Confetti.Cell.Content.fountain())
}


internal extension Confetti.Configuration {
    static func makeShower(with contents: [Confetti.Cell.Content]) -> Self {
        return Confetti.Configuration(
            cells: Confetti.Cell.makeShowerCells(with: contents)
        )
    }
    
    static func makeFountain(with contents: [Confetti.Cell.Content]) -> Self {
        return Confetti.Configuration(
            cells: Confetti.Cell.makeFountainCells(with: contents)
        )
    }
}

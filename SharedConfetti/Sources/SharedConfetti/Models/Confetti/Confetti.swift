//
//  ConfettiConfiguration.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/15/26.
//

import UIKit

public enum Confetti {
    public struct Configuration: Sendable {
        let cells: [Cell]
    }
}

public extension Confetti.Configuration {
    static let shower: Self = makeShower()
    static let fountain: Self = makeShower()
}

// MARK: - Factory Methods

extension Confetti.Configuration {
    internal static func makeShower(
        with contents: [Confetti.Cell.Content] = Confetti.Cell.Content.makeShowerContents()
    ) -> Self {
        return Confetti.Configuration(
            cells: Confetti.Cell.makeShowerCells(with: contents)
        )
    }
    
    internal static func makeFountain(
        with contents: [Confetti.Cell.Content] = Confetti.Cell.Content.makeFountainContents()
    ) -> Self {
        return Confetti.Configuration(
            cells: Confetti.Cell.makeFountainCells(with: contents)
        )
    }
}

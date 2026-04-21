//
//  ConfettiConfiguration.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/15/26.
//

public extension Confetti {
    public struct Configuration: Sendable {
        let cells: [Cell]
    }
}

public extension Confetti.Configuration {
    static let shower: Self = makeShower()
    static let fountain: Self = makeFountain()
}

// MARK: - Factory Methods

extension Confetti.Configuration {
    internal static func makeShower(
        with contents: [Confetti.Cell.Contents] = Confetti.Cell.Contents.makeShowerContents()
    ) -> Self {
        return Confetti.Configuration(
            cells: Confetti.Cell.makeShowerCells(with: contents)
        )
    }
    
    internal static func makeFountain(
        with contents: [Confetti.Cell.Contents] = Confetti.Cell.Contents.makeFountainContents()
    ) -> Self {
        return Confetti.Configuration(
            cells: Confetti.Cell.makeFountainCells(with: contents)
        )
    }
}

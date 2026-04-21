//
//  ConfettiConfiguration.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/15/26.
//

import CoreFoundation

public extension Confetti {
    struct Configuration: Sendable {
        let emitter: Emitter
        let cells: [Cell]
    }
}

// MARK: - Factory Methods

extension Confetti.Configuration {
    internal static func makeConfiguration(
        for style: Confetti.Style,
        in rect: CGRect
    ) -> Confetti.Configuration {
        switch style {
        case .fountain: return .makeFountain(in: rect)
        case .shower: return makeShower(in: rect)
        case .cannons: return makeCannons(in: rect)
        }
    }
    
    private static func makeFountain(in rect: CGRect) -> Self {
        let contents = Confetti.Cell.Contents.makeFountainContents()
        return Confetti.Configuration(
            emitter: .fountain(in: rect),
            cells: Confetti.Cell.makeFountainCells(with: contents)
        )
    }
    
    private static func makeShower(in rect: CGRect) -> Self {
        let contents = Confetti.Cell.Contents.makeShowerContents()
        return Confetti.Configuration(
            emitter: .shower(in: rect),
            cells: Confetti.Cell.makeShowerCells(with: contents),
        )
    }
    
    private static func makeCannons(in rect: CGRect) -> Self {
        let contents = Confetti.Cell.Contents.makeCannonsContents()
        return Confetti.Configuration(
            emitter: .cannons(in: rect),
            cells: Confetti.Cell.makeCannonsCells(with: contents),
        )
    }
}

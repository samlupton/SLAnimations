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

extension Confetti.Configuration {
    static let shower: Self = .shower
}

extension ConfettiGenerator: Sendable {
    @MainActor static let shower: ConfettiGenerator = Shower()
}

internal extension Confetti {
    static func makeShower(with contents: [Confetti.Cell.Contents]) -> Confetti.Configuration {
        let cells = contents.map { content in
            makeTemplateShowerCell(add: content)
        }
        
        return Configuration(cells: cells)
    }
}

internal extension Confetti {
    static func makeTemplateShowerCell(add content: Confetti.Cell.Contents) -> Confetti.Cell {
        return .init(
            lifetime: .init(birthRate: 10, base: 2, range: 1),
            spin: .init(base: .zero, range: 2 * .pi),
            scale: .init(base: 0.3, range: 0.1, speed: -0.1),
            acceleration: .init(y: 300),
            velocity: .init(base: 100, range: 50),
            emission: .init(longitude: .zero, range: 2 * .pi),
            contents: content
        )
    }
}

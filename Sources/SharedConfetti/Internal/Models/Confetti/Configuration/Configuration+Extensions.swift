//
//  Configuration+Extensions
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 4/22/26.
//

import CoreFoundation

// MARK: - Factory Methods

internal extension Confetti.Configuration {
    static func makeConfiguration(
        for style: Confetti.Style,
        in rect: CGRect
    ) -> Confetti.Configuration {
        switch style {
        case .fountain: return .makeFountain(in: rect)
        case .shower: return makeShower(in: rect)
        case .leftCannon: return makeLeftCannon(in: rect)
        case .rightCannon: return makeRightCannon(in: rect)
        }
    }
    
    private static func makeFountain(in rect: CGRect) -> Self {
        return Confetti.Configuration(
            emitter: .makeFountainEmitter(in: rect),
            cells: Confetti.Cell.makeFountainCells(
                with: Confetti.Cell.Contents.makeFountainContents()
            )
        )
    }
    
    private static func makeShower(in rect: CGRect) -> Self {
        return Confetti.Configuration(
            emitter: .makeShowerEmitter(in: rect),
            cells: Confetti.Cell.makeShowerCells(
                with: Confetti.Cell.Contents.makeShowerContents()
            )
        )
    }
    
    private static func makeLeftCannon(in rect: CGRect) -> Self {
        return Confetti.Configuration(
            emitter: .makeLeftCannonEmitter(in: rect),
            cells: Confetti.Cell.makeLeftCannonCells(
                with: Confetti.Cell.Contents.makeLeftCannonContents()
            )
        )
    }
    
    private static func makeRightCannon(in rect: CGRect) -> Self {
        return Confetti.Configuration(
            emitter: .makeRightCannonEmitter(in: rect),
            cells: Confetti.Cell.makeRightCannonCells(
                with: Confetti.Cell.Contents.makeRightCannonContents()
            )
        )
    }
}

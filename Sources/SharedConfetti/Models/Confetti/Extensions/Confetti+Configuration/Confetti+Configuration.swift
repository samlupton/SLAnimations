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
        let opacity: Float
        
        init(emitter: Emitter, opacity: Float = 1) {
            self.emitter = emitter
            self.opacity = opacity
        }
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
        case .leftCannon: return makeLeftCannon(in: rect)
        case .rightCannon: return makeRightCannon(in: rect)
        }
    }
    
    private static func makeFountain(in rect: CGRect) -> Self {
        return Confetti.Configuration(
            emitter: .makeFountainEmitter(in: rect)
        )
    }
    
    private static func makeShower(in rect: CGRect) -> Self {
        return Confetti.Configuration(
            emitter: .makeShowerEmitter(in: rect),
            opacity: 0.5
        )
    }
    
    private static func makeLeftCannon(in rect: CGRect) -> Self {
        return Confetti.Configuration(
            emitter: .makeLeftCannonEmitter(in: rect)
        )
    }
    
    private static func makeRightCannon(in rect: CGRect) -> Self {
        return Confetti.Configuration(
            emitter: .makeRightCannonEmitter(in: rect)
        )
    }
}

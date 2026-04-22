//
//  Emitter+Mode.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/20/26.
//

import QuartzCore

public extension Confetti.Emitter {
    enum Mode: Sendable {
        case points, outline, surface, volume
    }
}

// MARK: - CAEmitterLayer Connector

extension Confetti.Emitter.Mode {
    internal static func emitterMode(from mode: Confetti.Emitter.Mode) -> CAEmitterLayerEmitterMode {
        switch mode {
        case .points: return .points
        case .outline: return .outline
        case .surface: return .surface
        case .volume: return .volume
        }
    }
}

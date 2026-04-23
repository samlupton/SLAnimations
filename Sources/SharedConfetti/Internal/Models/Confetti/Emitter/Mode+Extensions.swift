//
//  Confetti+Emitter+Mode+Extensions.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 4/22/26.
//

import QuartzCore

// MARK: - CAEmitterLayer Connector

internal extension Confetti.Emitter.Mode {
    static func emitterMode(from mode: Confetti.Emitter.Mode) -> CAEmitterLayerEmitterMode {
        switch mode {
        case .points: return .points
        case .outline: return .outline
        case .surface: return .surface
        }
    }
}

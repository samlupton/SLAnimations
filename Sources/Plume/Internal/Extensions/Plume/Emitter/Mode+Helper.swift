//
//  Mode+Helper.swift
//  PlumeAnimation
//
//  Created by Samuel Lupton on 4/22/26.
//

import QuartzCore

// MARK: - Helper Methods

internal extension Plume.Emitter.Mode {
    static func emitterMode(from mode: Plume.Emitter.Mode) -> CAEmitterLayerEmitterMode {
        switch mode {
        case .points: return .points
        case .outline: return .outline
        case .surface: return .surface
        }
    }
}

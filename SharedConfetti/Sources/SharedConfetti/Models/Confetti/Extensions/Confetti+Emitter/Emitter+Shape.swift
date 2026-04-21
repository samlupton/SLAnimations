//
//  Emitter+Shape.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/20/26.
//

import QuartzCore

public extension Confetti.Emitter {
    enum Shape: Sendable {
        case point, line, rectangle, circle, cuboid, sphere
    }
}

extension Confetti.Emitter.Shape {
    internal static func emitterShape(from shape: Confetti.Emitter.Shape) -> CAEmitterLayerEmitterShape {
        switch shape {
        case .point: return .point
        case .line: return .line
        case .rectangle: return .rectangle
        case .circle: return .circle
        case .cuboid: return .cuboid
        case .sphere: return .sphere
        }
    }
}

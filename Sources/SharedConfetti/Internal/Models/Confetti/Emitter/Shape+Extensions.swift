//
//  Confetti+Emitter+Shape+Extensions
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 4/22/26.
//

import QuartzCore

internal extension Confetti.Emitter.Shape {
    static func emitterShape(from shape: Confetti.Emitter.Shape) -> CAEmitterLayerEmitterShape {
        switch shape {
        case .point: return .point
        case .line: return .line
        case .rectangle: return .rectangle
        case .circle: return .circle
        }
    }
}

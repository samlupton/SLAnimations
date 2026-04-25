//
//  Plume+Emitter+Shape+Extensions
//  PlumeAnimation
//
//  Created by Samuel Lupton on 4/22/26.
//

import QuartzCore

internal extension Plume.Emitter.Shape {
    static func emitterShape(from shape: Plume.Emitter.Shape) -> CAEmitterLayerEmitterShape {
        switch shape {
        case .point: return .point
        case .line: return .line
        case .rectangle: return .rectangle
        case .circle: return .circle
        }
    }
}

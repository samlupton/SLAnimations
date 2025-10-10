//
//  ConfettiModels.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/1/25.
//

import Foundation
import UIKit

enum ConfettiConfiguration {
    case cannon
    case shower
    
    var model: EmitterLayerConfiguration {
        switch self {
        case .cannon:
            ConfettiCannons()
        case .shower:
            ConfettiShower()
        }
    }
}

private struct ConfettiCannons: EmitterLayerConfiguration {
    var emitterPosition: CGPoint = CGPoint(x: UIScreen.main.bounds.width, y: UIScreen.main.bounds.height / 2)
    var emitterShape: CAEmitterLayerEmitterShape = .point
    var emitterMode: CAEmitterLayerEmitterMode = .points
    var emitterSize: CGSize = .zero
    var birthRate: Float = 0
    var lifetime: Float = 5
    var needsDisplayOnBoundsChange: Bool = true
    var cellConfiguration: ParticleCell = CannonCell()
}

private struct ConfettiShower: EmitterLayerConfiguration {
    var emitterPosition: CGPoint = CGPoint(x: UIScreen.main.bounds.width / 2, y: 0)
    var emitterShape: CAEmitterLayerEmitterShape = .line
    var emitterMode: CAEmitterLayerEmitterMode = .surface
    var emitterSize = CGSize(width: UIScreen.main.bounds.width, height: 1)
    var birthRate: Float = 0
    var lifetime: Float = 5
    var needsDisplayOnBoundsChange: Bool = true
    var cellConfiguration: ParticleCell = ShowerCell()
}

private struct CannonCell: ParticleCell {
    var birthRate: Float = 25
    var lifetime: Float = 5
    var velocity: CGFloat = 200
    var emissionLongitude: CGFloat = 5 * .pi / 4
    var emissionRange: CGFloat = .pi / 8
    var spin: CGFloat = .pi / 2
    var spinRange: CGFloat = 4 * .pi
    var yAcceleration: CGFloat = 200
    var scaleRange: CGFloat = 0.75
}

private struct ShowerCell: ParticleCell {
    var birthRate: Float = 100
    var lifetime: Float = 5
    var velocity: CGFloat = 200
    var emissionLongitude: CGFloat = .pi
    var emissionRange: CGFloat = 0
    var spin: CGFloat = 0
    var spinRange: CGFloat = 0
    var yAcceleration: CGFloat = 400
    var scaleRange: CGFloat = 0.75
}

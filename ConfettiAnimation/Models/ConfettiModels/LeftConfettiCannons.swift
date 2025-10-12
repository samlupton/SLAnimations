//
//  LeftConfettiCannons.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/11/25.
//

import UIKit

class LeftConfettiCannons: EmitterLayerConfiguration {
    var emitterPosition: EmitterPosition = .leading
    var emitterShape: CAEmitterLayerEmitterShape = .point
    var emitterMode: CAEmitterLayerEmitterMode = .points
    var emitterSize: CGSize = .zero
    var birthRate: Float = 1
    var lifetime: Float = 5
    var needsDisplayOnBoundsChange: Bool = true
    var cellConfiguration: ParticleCell = LeftCannonCell()
    var content: [UIImage] {
        ConfettiImageRenderer().getConfettiParticles(scale: 15.0)
    }
    
    func getAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "birthRate")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 0.1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        return animation
    }
}

private struct LeftCannonCell: ParticleCell {
    var birthRate: Float = 10
    var lifetime: Float = 5
    var velocity: CGFloat = 200
    var emissionLongitude: CGFloat = -1 * .pi / 4
    var emissionRange: CGFloat = .pi / 8
    var spin: CGFloat = .pi
    var spinRange: CGFloat = 4 * .pi
    var yAcceleration: CGFloat = 200
    var scale: CGFloat = 0.65
    var scaleRange: CGFloat = 0.5
}

//
//  RocketPropulsion.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/11/25.
//

import SwiftUI

@MainActor
struct RocketPropulsion: EmitterLayerConfiguration {
    var emitterPosition: EmitterPosition = .center
    var emitterShape: CAEmitterLayerEmitterShape = .line
    var emitterMode: CAEmitterLayerEmitterMode = .surface
    var emitterSize = CGSize(width: 13, height: 0)
    var birthRate: Float = 0
    var lifetime: Float = 5
    var needsDisplayOnBoundsChange: Bool = true
    var cellConfiguration: ParticleCell = RocketPropulsionCell()
    var content: [UIImage] {
        ConfettiImageRenderer().getFireParticles(scale: 1.0)
    }
    
    func getAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "birthRate")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 120
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        return animation
    }
}

private struct RocketPropulsionCell: ParticleCell {
    var birthRate: Float = 10000
    var lifetime: Float = 0.025
    var velocity: CGFloat = 600
    var emissionLongitude: CGFloat = .pi
    var emissionRange: CGFloat = .pi / 32
    var spin: CGFloat = 0
    var spinRange: CGFloat = 0
    var yAcceleration: CGFloat = 0
    var scale: CGFloat = 0.5
    var scaleRange: CGFloat = 0.999
}

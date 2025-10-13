//
//  ConfettiShower.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/11/25.
//

import SwiftUI

@MainActor
struct ConfettiShower: EmitterLayerConfiguration {
    var emitterPosition: EmitterPosition = .top
    var emitterShape: CAEmitterLayerEmitterShape = .line
    var emitterMode: CAEmitterLayerEmitterMode = .surface
    var emitterSize = CGSize(width: UIScreen.main.bounds.width, height: 0)
    var birthRate: Float = 0
    var lifetime: Float = 5
    var needsDisplayOnBoundsChange: Bool = true
    var cellConfiguration: ParticleCell = ShowerCell()
    var content: [UIImage] {
        ConfettiImageRenderer().getConfettiParticles()
    }
    
    func getAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "birthRate")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        return animation
    }
}

private struct ShowerCell: ParticleCell {
    var birthRate: Float = 100
    var lifetime: Float = 5
    var velocity: CGFloat = 200
    var emissionLongitude: CGFloat = .pi
    var emissionRange: CGFloat = .pi / 4
    var spin: CGFloat = .pi
    var spinRange: CGFloat = 2 * .pi
    var yAcceleration: CGFloat = 400
    var scale: CGFloat = 0.5
    var scaleRange: CGFloat = 0.75
}

//
//  StarShower 2.swift
//  SLAnimations
//
//  Created by Samuel Lupton on 10/14/25.
//


//
//  StarShower.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/11/25.
//

import SwiftUI

@MainActor
struct SnowyNight: EmitterLayerConfiguration {
    var emitterPosition: EmitterPosition = .top
    var emitterShape: CAEmitterLayerEmitterShape = .line
    var emitterMode: CAEmitterLayerEmitterMode = .surface
    var emitterSize = CGSize(width: UIScreen.main.bounds.width, height: 0)
    var birthRate: Float = 0
    var lifetime: Float = 20
    var needsDisplayOnBoundsChange: Bool = true
    var cellConfiguration: ParticleCell = SnowCell()
    var content: [UIImage] {
        [UIImage(resource: .snow)]
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

private struct SnowCell: ParticleCell {
    var birthRate: Float = 50
    var lifetime: Float = 120
    var velocity: CGFloat = 50
    var emissionLongitude: CGFloat = .pi
    var emissionRange: CGFloat = 0
    var spin: CGFloat = .pi / 2
    var spinRange: CGFloat = .pi / 2
    var yAcceleration: CGFloat = 0
    var scale: CGFloat = 0.01
    var scaleRange: CGFloat = 0.1
}

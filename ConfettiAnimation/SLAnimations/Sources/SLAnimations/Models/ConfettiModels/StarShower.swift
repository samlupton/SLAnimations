//
//  StarShower.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/11/25.
//

import SwiftUI

@MainActor
struct StarShower: EmitterLayerConfiguration {
    var emitterPosition: EmitterPosition = .top
    var emitterShape: CAEmitterLayerEmitterShape = .line
    var emitterMode: CAEmitterLayerEmitterMode = .surface
    var emitterSize = CGSize(width: UIScreen.main.bounds.width, height: 0)
    var birthRate: Float = 0
    var lifetime: Float = 20
    var needsDisplayOnBoundsChange: Bool = true
    var cellConfiguration: ParticleCell = StarCell()
    var content: [UIImage] {
        [UIImage(resource: .star)]
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
    
    func getSubViews() -> [UIView] {
        let uiImage = UIImage(resource: .rocket)
        let image = UIImageView(image: uiImage)
        let bounds = UIScreen.main.bounds
        let centerX = bounds.width / 2.0
        let centerY = bounds.height / 2.0
        image.frame = CGRect(
            x: centerX - image.frame.width / 2,
            y: centerY - image.frame.height,
            width: image.frame.width,
            height: image.frame.height
        )
        return [image]
    }
}

private struct StarCell: ParticleCell {
    var birthRate: Float = 2
    var lifetime: Float = 120
    var velocity: CGFloat = 50
    var emissionLongitude: CGFloat = .pi
    var emissionRange: CGFloat = 0
    var spin: CGFloat = 0
    var spinRange: CGFloat = 0
    var yAcceleration: CGFloat = 0
    var scale: CGFloat = 0.05
    var scaleRange: CGFloat = 0.15
}

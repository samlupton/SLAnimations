//
//  ConfettiLayer.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/1/25.
//

import QuartzCore
import UIKit

final class ConfettiLayer: CAEmitterLayer {
    /// Configured the emitter layer
    func configure(with configuration: EmitterLayerConfiguration) {
        emitterPosition = configuration.emitterPosition
        birthRate = configuration.birthRate
        lifetime = configuration.lifetime
        emitterSize = configuration.emitterSize
        needsDisplayOnBoundsChange = configuration.needsDisplayOnBoundsChange
        emitterCells = getContent().map { content in
            makeCell(content: content, with: configuration.cellConfiguration)
        }
    }
    
    /// Begins the process of emitting particles by adding an animation
    func emit() {
        beginTime = CACurrentMediaTime()
        add(getAnimation(), forKey: "confettiBirthRate")
    }
    
    /// Creates a CABasicAnimation
    func getAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: #keyPath(birthRate))
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        return animation
    }
}

//
//  ConfettiLayer.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/1/25.
//

import QuartzCore
import UIKit

final class ConfettiLayer: CAEmitterLayer {

    init(configuration: EmitterLayerConfiguration) {
        super.init()
        configure(with: configuration)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Configured the emitter layer
    /// - Parameters
    ///     - configuration: The configuration model used to set up the emitter layer
    private func configure(with configuration: EmitterLayerConfiguration) {
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
    private func getAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: #keyPath(birthRate))
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        return animation
    }
}

//
//  ConfettiLayer.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/1/25.
//

import QuartzCore
import UIKit

final class ConfettiLayer: CAEmitterLayer {

    /// Configures a ConfettiLayer
    ///
    /// - Parameters:
    ///     - configuration: The configuration model used to set up the emitter layer
    init(configuration: ConfettiConfiguration) {
        super.init()
        configure(with: configuration.model)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Configures the emitter layer
    /// 
    /// - Parameters
    ///     - configuration: The configuration model used to set up the emitter layer
    private func configure(with configuration: EmitterLayerConfiguration) {
        emitterPosition = configuration.emitterPosition
        birthRate = configuration.birthRate
        lifetime = configuration.lifetime
        emitterSize = configuration.emitterSize
        emitterShape = configuration.emitterShape
        emitterMode = configuration.emitterMode
        needsDisplayOnBoundsChange = configuration.needsDisplayOnBoundsChange
        emitterCells = configuration.getContent().map { content in
            makeCell(content: content, with: configuration.cellConfiguration)
        }
    }
    
    /// Begins the process of emitting particles by adding an animation to the layer
    func emit() {
        add(getAnimation(), forKey: UUID().uuidString)
    }
    
    /// Creates a CABasicAnimation
    ///
    /// - Returns: An animation to be applied to a CAEmitterLayer
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


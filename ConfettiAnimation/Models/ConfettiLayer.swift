//
//  ConfettiLayer.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/1/25.
//

import QuartzCore
import UIKit

final class ConfettiLayer: CAEmitterLayer {

    private let configuration: ConfettiConfiguration
    
    /// Configures a ConfettiLayer
    /// - Parameters:
    ///     - configuration: The configuration model used to set up the emitter layer
    init(configuration: ConfettiConfiguration) {
        self.configuration = configuration
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Configures the emitter layer
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
    
    /// Begins the process of emitting particles by configuring the layer and adding an animation to the layer
    func emit() {
        configure(with: configuration.model)
        add(configuration.model.getAnimation(), forKey: UUID().uuidString)
    }
}


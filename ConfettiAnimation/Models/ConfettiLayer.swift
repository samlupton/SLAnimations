//
//  ConfettiLayer.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/1/25.
//

import QuartzCore
import UIKit

final class ConfettiLayer: CAEmitterLayer {

    private let configuration: EmitterLayerConfiguration
    
    /// Configures a ConfettiLayer
    /// - Parameters:
    ///     - configuration: The configuration model used to set up the emitter layer
    init(configuration: EmitterLayerConfiguration) {
        self.configuration = configuration
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Configures the emitter layer
    /// - Parameters
    ///     - configuration: The configuration model used to set up the emitter layer
    private func configure(with configuration: EmitterLayerConfiguration, for window: UIWindow?) {
        emitterPosition = getPosition(for: configuration.emitterPosition, with: window)
        birthRate = configuration.birthRate
        lifetime = configuration.lifetime
        emitterSize = configuration.emitterSize
        emitterShape = configuration.emitterShape
        emitterMode = configuration.emitterMode
        needsDisplayOnBoundsChange = configuration.needsDisplayOnBoundsChange
        emitterCells = configuration.content.map { content in
            makeCell(content: content, with: configuration.cellConfiguration)
        }
    }
    
    /// Begins the process of emitting particles by configuring the layer and adding an animation to the layer
    func emit(in window: UIWindow?) {
        configure(with: configuration, for: window)
        add(configuration.getAnimation(), forKey: UUID().uuidString)
    }
}

// MARK: Position handling function
extension ConfettiLayer {
    func getPosition(for position: EmitterPosition, with window: UIWindow?) -> CGPoint {
        guard
            let window = window,
            let windowScene = window.windowScene
        else {
            return CGPoint(x: 0, y: 0)
        }
        
        switch position {
        case .top:
            return CGPoint(x: windowScene.screen.bounds.width / 2, y: 0)
        case .leading:
            return CGPoint(x: 0, y: windowScene.screen.bounds.height / 2)
        case .trailing:
            return CGPoint(x: windowScene.screen.bounds.width, y: windowScene.screen.bounds.height / 2)
        case .bottom:
            return CGPoint(x: windowScene.screen.bounds.width, y: windowScene.screen.bounds.height)
        case .center:
            return CGPoint(x: windowScene.screen.bounds.width / 2, y: windowScene.screen.bounds.height / 2)
        }
    }
}

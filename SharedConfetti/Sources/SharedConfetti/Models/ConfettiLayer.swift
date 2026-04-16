//
//  ConfettiLayer.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 10/1/25.
//

import QuartzCore
import UIKit

final class ConfettiLayer: CAEmitterLayer {

    private let configuration: EmitterLayerConfiguration
    
    /// Configures a ConfettiLayer
    /// - Parameters:
    ///     - configuration: The configuration model used to set up the emitter layer.
    ///
    /// - Note: Every instance has a unique seed. This randomizes the particles.
    init(configuration: EmitterLayerConfiguration) {
        self.configuration = configuration
        super.init()
        seed = UInt32.random(in: 0...UInt32.max)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Configures the emitter layer
    /// - Parameters
    ///     - configuration: The configuration model used to set up the emitter layer
    ///     - window: The window in which the confetti should launch.
    private func configure(
        with configuration: EmitterLayerConfiguration,
        in window: UIWindow?
    ) {
        emitterPosition = getPosition(for: configuration.emitterPosition, with: window)
        birthRate = configuration.birthRate
        lifetime = configuration.lifetime
        emitterSize = configuration.emitterSize
        emitterShape = configuration.emitterShape
        emitterMode = configuration.emitterMode
        needsDisplayOnBoundsChange = configuration.needsDisplayOnBoundsChange
        
        emitterCells = configuration.makeCells()
    }
    
    /// Begins the process of emitting particles by configuring the layer and adding an animation to the layer
    func emit(in window: UIWindow?) {
        let id = UUID().uuidString
        configure(with: configuration, in: window)
        add(configuration.getAnimation(), forKey: id)
    }
}

// MARK: - Position handling function

extension ConfettiLayer {
    func getPosition(for position: EmitterPosition, with window: UIWindow?) -> CGPoint {
        guard let window = window else {
            return CGPoint(x: 0, y: 0)
        }

        let bounds = window.bounds
        let midX = bounds.midX
        let midY = bounds.midY
        let maxX = bounds.maxX
        let maxY = bounds.maxY
        
        switch position {
        case .top:
            return CGPoint(x: midX, y: bounds.minY)
        case .leading:
            return CGPoint(x: bounds.minX, y: midY)
        case .trailing:
            return CGPoint(x: maxX, y: midY)
        case .bottom:
            return CGPoint(x: midX, y: maxY)
        case .center:
            return CGPoint(x: midX, y: midY)
        }
    }
}

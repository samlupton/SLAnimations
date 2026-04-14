//
//  ConfettiLayer.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/1/25.
//

import QuartzCore
import UIKit

@MainActor
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
        seed = UInt32.random(in: 0...UInt32.max)
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
        let id = UUID().uuidString
        configure(with: configuration, in: window)
        add(configuration.getAnimation(), forKey: id)
    }
}

// MARK: - Emitter layer content renderer

extension ConfettiLayer: ContentRenderer {
    /// Creates and configures a `CAEmitterCell`.
    /// - Parameters:
    ///   - content: The image used as the particle content of the cell.
    ///   - configuration: The configuration model used to set up the emitter layer cell
    /// - Returns: A configured `CAEmitterCell` instance.
    func makeCell(content: UIImage, with configuration: ParticleCell) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.contents = content.cgImage
        cell.beginTime = CACurrentMediaTime()
        cell.birthRate = configuration.birthRate
        cell.lifetime = configuration.lifetime
        cell.velocity = configuration.velocity
        cell.velocityRange = configuration.velocity / 2
        cell.emissionLongitude = configuration.emissionLongitude
        cell.emissionRange = configuration.emissionRange
        cell.spin = configuration.spin
        cell.spinRange = configuration.spinRange
        cell.yAcceleration = configuration.yAcceleration
        cell.scaleRange = configuration.scaleRange
        cell.scale = configuration.scale
        return cell
    }
}

// MARK: - Position handling function

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


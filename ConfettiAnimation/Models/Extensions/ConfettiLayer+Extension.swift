//
//  ConfettiLayer+Extension.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/4/25.
//

import QuartzCore
import UIKit

// MARK: Emitter layer content renderer
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

// MARK: Position handling function
extension ConfettiLayer: EmitterGeometryProvider {
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

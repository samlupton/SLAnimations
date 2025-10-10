//
//  ConfettiLayer+Extension.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/4/25.
//

import QuartzCore
import UIKit
 
extension ConfettiLayer: ContentRenderer {
    /// Creates and configures a `CAEmitterCell`.
    ///
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
        cell.scale = 1.0 - configuration.scaleRange
        return cell
    }
    
    /// Creates an array of confetti peice images and returns it
    func getContent() -> [UIImage] {
        return [.confetti1, .confetti2, .confetti3, .confetti4, .confetti5, .confetti6, .confetti7, .confetti8]
            .compactMap { image in
            UIImage(resource: image)
        }
    }
}


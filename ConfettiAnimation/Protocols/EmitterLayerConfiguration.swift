//
//  EmitterLayerConfiguration.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/1/25.
//

import QuartzCore
import UIKit

protocol EmitterLayerConfiguration {
    var emitterPosition: CGPoint { get set }
    var emitterShape: CAEmitterLayerEmitterShape { get set }
    var emitterMode: CAEmitterLayerEmitterMode { get set }
    var emitterSize: CGSize { get set }
    var birthRate: Float { get set }
    var lifetime: Float { get set }
    var needsDisplayOnBoundsChange: Bool { get set }
    var cellConfiguration: ParticleCell { get set }
    
    /// Creates array of images to be used as content for CAEmitterLayer
    ///
    /// - Returns: The array of images to be used for content of CAEmitterLayer
    func getContent() -> [UIImage]
}

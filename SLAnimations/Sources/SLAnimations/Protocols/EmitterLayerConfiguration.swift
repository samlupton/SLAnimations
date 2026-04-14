//
//  EmitterLayerConfiguration.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/1/25.
//

import QuartzCore
import UIKit

/// A configuration that defines how a `CAEmitterLayer` produces and renders particles.
///
/// `EmitterLayerConfiguration` describes the full behavior of a confetti emitter,
/// including its geometry, emission characteristics, particle content, and animation.
///
/// Conforming types provide all inputs required to construct a `ConfettiLayer`.
/// This includes where particles originate, how they are emitted, and how individual
/// particles behave over time.
///
/// Use this protocol to create reusable confetti styles (e.g., cannons, showers, bursts)
/// by encapsulating emitter and particle configuration in a single type.
///
/// - SeeAlso: `ConfettiView`, `ConfettiLayer`, `ParticleCell`
public protocol EmitterLayerConfiguration {

    /// The position of the emitter within its parent coordinate space.
    var emitterPosition: EmitterPosition { get set }
    
    /// The geometric shape of the emitter (e.g., point, line, rectangle).
    var emitterShape: CAEmitterLayerEmitterShape { get set }
    
    /// The emission mode that controls how particles are distributed from the shape.
    var emitterMode: CAEmitterLayerEmitterMode { get set }
    
    /// The size of the emitter’s emission area.
    var emitterSize: CGSize { get set }
    
    /// The rate at which particles are generated.
    var birthRate: Float { get set }
    
    /// The duration (in seconds) that particles remain visible.
    var lifetime: Float { get set }
    
    /// Indicates whether the emitter should redraw when its bounds change.
    var needsDisplayOnBoundsChange: Bool { get set }
    
    /// Configuration describing the behavior of individual particles.
    var cellConfiguration: ParticleCell { get set }
    
    /// Creates an animation applied to the emitter layer.
    ///
    /// - Returns: A configured `CABasicAnimation` used to drive emitter behavior.
    func getAnimation() -> CABasicAnimation
    
    /// Generates the particle images used during emission.
    ///
    /// - Returns: An array of images representing particles.
    func makeParticles() -> [UIImage]
}

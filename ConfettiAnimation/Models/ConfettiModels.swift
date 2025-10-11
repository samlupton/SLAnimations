//
//  ConfettiModels.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/1/25.
//

import Foundation
import UIKit

enum ConfettiConfiguration {
    case rightCannon
    case leftCannon
    case shower
    case rocket
    
    var model: EmitterLayerConfiguration {
        switch self {
        case .rightCannon:
            RightConfettiCannons()
        case .leftCannon:
            LeftConfettiCannons()
        case .shower:
            ConfettiShower()
        case .rocket:
            RocketPropulsion()
        }
    }
}

private struct RightConfettiCannons: EmitterLayerConfiguration {
    var emitterPosition: CGPoint = CGPoint(x: UIScreen.main.bounds.width, y: UIScreen.main.bounds.height / 2)
    var emitterShape: CAEmitterLayerEmitterShape = .point
    var emitterMode: CAEmitterLayerEmitterMode = .points
    var emitterSize: CGSize = .zero
    var birthRate: Float = 1
    var lifetime: Float = 5
    var needsDisplayOnBoundsChange: Bool = true
    var cellConfiguration: ParticleCell = RightCannonCell()
    
    func getContent() -> [UIImage] {
        return [.confetti1, .confetti2, .confetti3, .confetti4, .confetti5, .confetti6, .confetti7, .confetti8]
            .compactMap { image in
                UIImage(resource: image)
            }
    }
    
    func getAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "birthRate")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 0.1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        return animation
    }
}

private struct LeftConfettiCannons: EmitterLayerConfiguration {
    var emitterPosition: CGPoint = CGPoint(x: 0, y: UIScreen.main.bounds.height / 2)
    var emitterShape: CAEmitterLayerEmitterShape = .point
    var emitterMode: CAEmitterLayerEmitterMode = .points
    var emitterSize: CGSize = .zero
    var birthRate: Float = 1
    var lifetime: Float = 5
    var needsDisplayOnBoundsChange: Bool = true
    var cellConfiguration: ParticleCell = LeftCannonCell()
    
    func getContent() -> [UIImage] {
        return [.confetti1, .confetti2, .confetti3, .confetti4, .confetti5, .confetti6, .confetti7, .confetti8]
            .compactMap { image in
                UIImage(resource: image)
            }
    }
    
    func getAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "birthRate")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 0.1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        return animation
    }
}

private struct ConfettiShower: EmitterLayerConfiguration {
    var emitterPosition: CGPoint = CGPoint(x: UIScreen.main.bounds.width / 2, y: 0)
    var emitterShape: CAEmitterLayerEmitterShape = .line
    var emitterMode: CAEmitterLayerEmitterMode = .surface
    var emitterSize = CGSize(width: UIScreen.main.bounds.width, height: 0)
    var birthRate: Float = 0
    var lifetime: Float = 5
    var needsDisplayOnBoundsChange: Bool = true
    var cellConfiguration: ParticleCell = ShowerCell()
    
    func getContent() -> [UIImage] {
        return [.confetti1, .confetti2, .confetti3, .confetti4, .confetti5, .confetti6, .confetti7, .confetti8]
            .compactMap { image in
            UIImage(resource: image)
        }
    }
    
    func getAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "birthRate")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        return animation
    }
}

private struct RocketPropulsion: EmitterLayerConfiguration {
    var emitterPosition: CGPoint = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
    var emitterShape: CAEmitterLayerEmitterShape = .point
    var emitterMode: CAEmitterLayerEmitterMode = .points
    var emitterSize = CGSize(width: 0, height: 0)
    var birthRate: Float = 0
    var lifetime: Float = 5
    var needsDisplayOnBoundsChange: Bool = true
    var cellConfiguration: ParticleCell = RocketPropulsionCell()

    func getContent() -> [UIImage] {
        return [.fire2, .fire3, .fire4]
            .compactMap { image in
            UIImage(resource: image)
        }
    }
    
    func getAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "birthRate")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 10
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        return animation
    }
}

private struct RightCannonCell: ParticleCell {
    var birthRate: Float = 10
    var lifetime: Float = 5
    var velocity: CGFloat = 200
    var emissionLongitude: CGFloat = 5 * .pi / 4
    var emissionRange: CGFloat = .pi / 8
    var spin: CGFloat = .pi
    var spinRange: CGFloat = 4 * .pi
    var yAcceleration: CGFloat = 200
    var scale: CGFloat = 0.65
    var scaleRange: CGFloat = 0.5
}

private struct LeftCannonCell: ParticleCell {
    var birthRate: Float = 10
    var lifetime: Float = 5
    var velocity: CGFloat = 200
    var emissionLongitude: CGFloat = -1 * .pi / 4
    var emissionRange: CGFloat = .pi / 8
    var spin: CGFloat = .pi
    var spinRange: CGFloat = 4 * .pi
    var yAcceleration: CGFloat = 200
    var scale: CGFloat = 0.65
    var scaleRange: CGFloat = 0.5
}

private struct ShowerCell: ParticleCell {
    var birthRate: Float = 100
    var lifetime: Float = 5
    var velocity: CGFloat = 200
    var emissionLongitude: CGFloat = .pi
    var emissionRange: CGFloat = .pi / 4
    var spin: CGFloat = .pi
    var spinRange: CGFloat = 2 * .pi
    var yAcceleration: CGFloat = 400
    var scale: CGFloat = 0.5
    var scaleRange: CGFloat = 0.75
}

private struct RocketPropulsionCell: ParticleCell {
    var birthRate: Float = 10000
    var lifetime: Float = 0.025
    var velocity: CGFloat = 600
    var emissionLongitude: CGFloat = .pi / 2
    var emissionRange: CGFloat = .pi / 32
    var spin: CGFloat = 0
    var spinRange: CGFloat = 0
    var yAcceleration: CGFloat = 0
    var scale: CGFloat = 0.5
    var scaleRange: CGFloat = 0.999
}

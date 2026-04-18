//
//  Shower.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/17/26.
//


import QuartzCore
import UIKit

public struct Shower: ConfettiGenerator {
    public func makeConfetti(with cells: [CAEmitterCell]) -> CAEmitterLayer {
        let emitter = CAEmitterLayer()
        emitter.birthRate = 1
        emitter.lifetime = 1
        emitter.emitterSize = .init(width: 900, height: .zero)
        emitter.emitterShape = .line
        emitter.emitterMode = .outline
        emitter.needsDisplayOnBoundsChange = true
        emitter.emitterCells = cells
        emitter.opacity = 0.5
        return emitter
    }
    
    public func makeCells(with images: [UIImage]) -> [CAEmitterCell] {
        return images.map { image in
            let cell = CAEmitterCell()
            cell.beginTime = CACurrentMediaTime()
            cell.birthRate = 10
            cell.lifetime = 2
            cell.lifetimeRange = 1
            cell.velocity = 100
            cell.velocityRange = 50
            cell.emissionLongitude = .zero
            cell.emissionRange = 2 * .pi
            cell.spin = 0
            cell.spinRange = 2 * .pi
            cell.yAcceleration = 300
            cell.scale = 0.2
            cell.scaleRange = 0.2
            cell.contents = image.cgImage
            
            return cell
        }
    }
    
    public func makeAnimation() -> CABasicAnimation {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
//        rotateAnimation.fromValue = 0
//        rotateAnimation.toValue = Double.pi * 2
//        rotateAnimation.duration = 5.0
//        rotateAnimation.repeatCount = .infinity
        return rotateAnimation
    }
}


//        static let celebration
//        static let explosion
//        static let fireworks
//        static let rain
//        static let snowfall
//        static let cannonLeft
//        static let cannonRight
//        static let fountain
//        static let burstPulse
//        static let sparkle
//        static let confettiStorm
//        static let drift
//        static let gravityFall

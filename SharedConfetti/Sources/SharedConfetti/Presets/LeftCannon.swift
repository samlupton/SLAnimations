//
//  File.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/17/26.
//


import QuartzCore
import UIKit

public protocol ConfettiGenerator {
    func makeConfetti(with cells: [CAEmitterCell]) -> CAEmitterLayer
    func makeCells(with image: [UIImage]) -> [CAEmitterCell]
    func makeAnimation() -> CABasicAnimation
}

public struct LeftCannon: ConfettiGenerator {
    public func makeConfetti(with cells: [CAEmitterCell]) -> CAEmitterLayer {
        let emitter = CAEmitterLayer()
        emitter.birthRate = 1.0
        emitter.lifetime = 1.0
        emitter.emitterSize = .zero
        emitter.emitterShape = .point
        emitter.emitterMode = .outline
        emitter.needsDisplayOnBoundsChange = true
        emitter.emitterCells = cells
        return emitter
    }
    
    public func makeCells(with images: [UIImage]) -> [CAEmitterCell] {
        return images.map { image in
            let cell = CAEmitterCell()
            cell.beginTime = CACurrentMediaTime()
            cell.birthRate = 10
            cell.lifetime = 5
            cell.velocity = 300
            cell.emissionLongitude = -.pi / 8
            cell.emissionRange = .pi / 20
            cell.spin = 0
            cell.spinRange = 2 * .pi
            cell.yAcceleration = 200
            cell.scale = 0.25
            cell.scaleRange = 0.25
            cell.contents = image.cgImage
            
            return cell
        }
    }
    
    public func makeAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "birthRate")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 0.1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        return animation
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

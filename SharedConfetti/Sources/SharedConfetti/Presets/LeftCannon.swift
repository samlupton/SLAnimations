//
//  File.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/17/26.
//


import QuartzCore
import UIKit

public struct LeftCannon: ConfettiGenerator {
    public var images: [UIImage]
    public var intensity: Confetti.Intensity
    
    init(
        images: [UIImage] = Confetti.Assets.allImages,
        intensity: Confetti.Intensity = .normal
    ) {
        self.images = images
        self.intensity = intensity
    }
    
    public func makeConfetti(with cells: [CAEmitterCell], in rect: CGRect) -> CAEmitterLayer {
        let emitter = CAEmitterLayer()
        emitter.birthRate = 1.0
        emitter.lifetime = 1
        emitter.emitterPosition = .init(x: .zero, y: rect.midY)
        emitter.emitterSize = .zero
        emitter.emitterShape = .point
        emitter.emitterMode = .outline
        emitter.needsDisplayOnBoundsChange = true
        emitter.emitterCells = cells.shuffled()
        
        return emitter
    }
    
    public func makeCells() -> [CAEmitterCell] {
        return images.map { image in
            let cell = CAEmitterCell()
            cell.beginTime = CACurrentMediaTime()
            cell.birthRate = 10
            cell.lifetime = 5
            cell.velocity = 300
            cell.emissionLongitude = -.pi / 6
            cell.emissionRange = .pi / 20
            cell.spin = 0
            cell.spinRange = 2 * .pi
            cell.yAcceleration = 200
            cell.scale = 0.4
            cell.scaleRange = 0.2
            cell.contents = image.cgImage
            
            return cell
        }
    }
    
    public func makeAnimation() -> CABasicAnimation? {
        let animation = CABasicAnimation(keyPath: "birthRate")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 0.5
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        return animation
    }
}

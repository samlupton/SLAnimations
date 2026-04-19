//
//  Fountain.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/18/26.
//

import QuartzCore
import UIKit

public struct Fountain: ConfettiGenerator {
    public var images: [UIImage]
    public var intensity: Confetti.Intensity
    
    init(
        images: [UIImage] = Confetti.Assets.waterImages,
        intensity: Confetti.Intensity = .extraHigh
    ) {
        self.images = images
        self.intensity = intensity
    }
    
    public func makeConfetti(
        with cells: [CAEmitterCell],
        in rect: CGRect
    ) -> CAEmitterLayer {
        let emitter = CAEmitterLayer()
        emitter.birthRate = 1
        emitter.lifetime = 1
        emitter.emitterPosition = .init(x: rect.midX, y: rect.maxY)
        emitter.emitterSize = .init(width: 0, height: 0)
        emitter.emitterShape = .point
        emitter.emitterMode = .outline
        emitter.needsDisplayOnBoundsChange = true
        emitter.emitterCells = cells
        emitter.opacity = 0.5
        return emitter
    }
    
    public func makeCells() -> [CAEmitterCell] {
        return images.map { image in
            let cell = CAEmitterCell()
            cell.beginTime = CACurrentMediaTime()
            cell.birthRate = 100 * intensity.multiplier
            cell.lifetime = 2
            cell.lifetimeRange = 1
            cell.velocity = 200
            cell.velocityRange = 50
            cell.emissionLongitude = -.pi / 2
            cell.emissionRange = .pi / 4
            cell.spin = 0
            cell.spinRange = 2 * .pi
            cell.yAcceleration = 200
            cell.scale = 0.1
            cell.scaleRange = 0.2
            cell.contents = image.cgImage
            
            return cell
        }
    }
    
    public func makeAnimation() -> CABasicAnimation? {
        return nil
    }
}

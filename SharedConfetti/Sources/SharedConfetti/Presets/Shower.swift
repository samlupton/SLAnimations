////
////  Shower.swift
////  SharedConfetti
////
////  Created by Samuel Lupton on 4/17/26.
////
//
//
//import QuartzCore
//import UIKit
//
//public struct Shower: ConfettiGenerator {
//    public var images: [UIImage]
//    
//    init(customImages: [UIImage]? = nil) {
//        self.images = customImages ?? Confetti.Assets.allImages
//    }
//    
//    public func makeConfetti(
//        with cells: [CAEmitterCell],
//        in rect: CGRect
//    ) -> CAEmitterLayer {
//        let emitter = CAEmitterLayer()
//        emitter.birthRate = 1
//        emitter.lifetime = 1
//        emitter.emitterPosition = .init(x: rect.midX, y: .zero)
//        emitter.emitterSize = .init(width: rect.width, height: .zero)
//        emitter.emitterShape = .line
//        emitter.emitterMode = .outline
//        emitter.needsDisplayOnBoundsChange = true
//        emitter.emitterCells = cells
//        emitter.opacity = 0.5
//        return emitter
//    }
//    
//    public func makeCells() -> [CAEmitterCell] {
//        return images.map { image in
//            let cell = CAEmitterCell()
//            cell.beginTime = CACurrentMediaTime()
//            cell.birthRate = 10
//            
//            
////            cell.lifetime = 2
////            cell.lifetimeRange = 1
////            cell.velocity = 100
////            cell.velocityRange = 50
////            cell.emissionLongitude = .zero
////            cell.emissionRange = 2 * .pi
////            cell.spin = 0
////            cell.spinRange = 2 * .pi
////            cell.yAcceleration = 300
////            cell.scale = 0.3
////            cell.scaleRange = 0.1
////            cell.contents = image.cgImage
////            cell.scaleSpeed = -0.1
//            return cell
//        }
//    }
//    
//    public func makeAnimation() -> CABasicAnimation? {
//        return nil
//    }
//}
//
//
////        static let celebration
////        static let explosion
////        static let fireworks
////        static let rain
////        static let snowfall
////        static let cannonLeft
////        static let cannonRight
////        static let fountain
////        static let burstPulse
////        static let sparkle
////        static let confettiStorm
////        static let drift
////        static let gravityFall

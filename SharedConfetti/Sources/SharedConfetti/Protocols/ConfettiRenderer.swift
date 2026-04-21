//
//  ConfettiRenderer.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/18/26.
//

import QuartzCore
import UIKit

internal protocol ConfettiRenderer {
    func makeConfetti(with cells: [CAEmitterCell], in rect: CGRect) -> CAEmitterLayer
    func makeCells() -> [CAEmitterCell]
    func makeAnimation() -> CABasicAnimation?
    
    // MARK: - CAEmitterCell Set Up Methods
    
    func makeCACell(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    func makeAcceleration(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    func makeContent(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    func makeEmission(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    func makeScale(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    func makeVelocity(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    func makeLifetime(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    func makeSpin(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    
    // MARK: - CAEmitterLayer Set Up Methods
    
    func makeCAEmitter(_ caemitter: inout CAEmitterLayer, with emitter: Confetti.Emitter)
    func makeEmitterCells(_ caemitter: inout CAEmitterLayer, with emitter: Confetti.Emitter)
    func makeEmitterGeometry(_ caemitter: inout CAEmitterLayer, with emitter: Confetti.Emitter)
    func makeEmitterMode(_ caemitter: inout CAEmitterLayer, with emitter: Confetti.Emitter)
    func makeEmitterShape(_ caemitter: inout CAEmitterLayer, with emitter: Confetti.Emitter)
}

// MARK: - CAEmitterCell Default Implementation

extension ConfettiRenderer {
    func makeCACell(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
        makeAcceleration(&cacell, cell: cell)
        makeContent(&cacell, cell: cell)
        makeEmission(&cacell, cell: cell)
        makeScale(&cacell, cell: cell)
        makeVelocity(&cacell, cell: cell)
        makeLifetime(&cacell, cell: cell)
        makeSpin(&cacell, cell: cell)
    }
    
    func makeAcceleration(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
        cacell.xAcceleration = cell.acceleration.x
        cacell.yAcceleration = cell.acceleration.y
        cacell.zAcceleration = cell.acceleration.z
    }
    
    func makeContent(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
        cacell.scale = cell.contents.scale
        cacell.contents = cell.contents.image
        cacell.contentsRect = cell.contents.rect
    }
    
    func makeEmission(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
        cacell.emissionLongitude = cell.emission.longitude
        cacell.emissionLatitude = cell.emission.latitude
        cacell.emissionRange = cell.emission.range
    }
    
    func makeScale(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
        cacell.scale = cell.scale.base
        cacell.scaleRange = cell.scale.range
        cacell.scaleSpeed = cell.scale.speed
    }
    
    func makeVelocity(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
        cacell.velocity = cell.velocity.base
        cacell.velocityRange = cell.velocity.range
    }
    
    func makeLifetime(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
        cacell.lifetime = cell.lifetime.base
        cacell.lifetimeRange = cell.lifetime.range
        cacell.birthRate = cell.lifetime.birthRate
    }
    
    func makeSpin(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
        cacell.spin = cell.spin.base
        cacell.spinRange = cell.spin.range
    }
}

// MARK: - CAEmitterLayer Default Implementation

extension ConfettiRenderer {
    func makeCAEmitter(_ caemitter: inout CAEmitterLayer, with emitter: Confetti.Emitter) {
        makeEmitterCells(&caemitter, with: emitter)
        makeEmitterGeometry(&caemitter, with: emitter)
        makeEmitterMode(&caemitter, with: emitter)
        makeEmitterShape(&caemitter, with: emitter)
    }
    
    func makeEmitterCells(_ caemitter: inout CAEmitterLayer, with emitter: Confetti.Emitter) {
        caemitter.beginTime = CACurrentMediaTime()
        caemitter.emitterCells = emitter.cells.map { cell in
            var cacell = CAEmitterCell()
            makeCACell(&cacell, cell: cell)
            return cacell
        }
    }

    func makeEmitterGeometry(_ caemitter: inout CAEmitterLayer, with emitter: Confetti.Emitter) {
        caemitter.emitterSize = emitter.geometry.size
        caemitter.emitterPosition = emitter.geometry.position
    }

    func makeEmitterMode(_ caemitter: inout CAEmitterLayer, with emitter: Confetti.Emitter) {
        caemitter.emitterMode = Confetti.Emitter.Mode.emitterMode(from: emitter.mode)
    }

    func makeEmitterShape(_ caemitter: inout CAEmitterLayer, with emitter: Confetti.Emitter) {
        caemitter.emitterShape = Confetti.Emitter.Shape.emitterShape(from: emitter.shape)
    }
}

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
    func makeAnimation() -> CABasicAnimation?
    
    // MARK: - CAEmitterCell Set Up Methods
    
    func makeCACell(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    func makeCellAcceleration(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    func makeCellContent(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    func makeCellEmission(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    func makeCellScale(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    func makeCellVelocity(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    func makeCellLifetime(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    func makeCellSpin(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    
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
        cacell.beginTime = CACurrentMediaTime()
        makeCellAcceleration(&cacell, cell: cell)
        makeCellContent(&cacell, cell: cell)
        makeCellEmission(&cacell, cell: cell)
        makeCellScale(&cacell, cell: cell)
        makeCellVelocity(&cacell, cell: cell)
        makeCellLifetime(&cacell, cell: cell)
        makeCellSpin(&cacell, cell: cell)
    }
    
    func makeCellAcceleration(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
        cacell.xAcceleration = cell.acceleration.x
        cacell.yAcceleration = cell.acceleration.y
        cacell.zAcceleration = cell.acceleration.z
    }
    
    func makeCellContent(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
        cacell.scale = cell.contents.scale
        cacell.contents = cell.contents.image
        cacell.contentsRect = cell.contents.rect
    }
    
    func makeCellEmission(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
        cacell.emissionLongitude = cell.emission.longitude
        cacell.emissionLatitude = cell.emission.latitude
        cacell.emissionRange = cell.emission.range
    }
    
    func makeCellScale(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
        cacell.scale = cell.scale.base
        cacell.scaleRange = cell.scale.range
        cacell.scaleSpeed = cell.scale.speed
    }
    
    func makeCellVelocity(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
        cacell.velocity = cell.velocity.base
        cacell.velocityRange = cell.velocity.range
    }
    
    func makeCellLifetime(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
        cacell.lifetime = cell.lifetime.base
        cacell.lifetimeRange = cell.lifetime.range
        cacell.birthRate = cell.lifetime.birthRate
    }
    
    func makeCellSpin(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
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

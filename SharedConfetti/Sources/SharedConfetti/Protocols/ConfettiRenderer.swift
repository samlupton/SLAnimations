//
//  ConfettiRenderer.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/18/26.
//

import QuartzCore
import UIKit

internal protocol ConfettiRenderer {
//    func makeConfetti(with cells: [CAEmitterCell], in rect: CGRect) -> CAEmitterLayer
//    func makeAnimation() -> CABasicAnimation?
    
    // MARK: - CAEmitterCell Set Up Methods
    
    func makeCACell(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    func setCellAcceleration(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    func setCellContent(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    func setCellEmission(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    func setCellScale(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    func setCellVelocity(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    func setCellLifetime(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    func setCellSpin(_ cacell: inout CAEmitterCell, cell: Confetti.Cell)
    
    // MARK: - CAEmitterLayer Set Up Methods
    
    func makeCAEmitter(_ caemitter: inout CAEmitterLayer, with emitter: Confetti.Emitter)
    func setEmitterCells(_ caemitter: inout CAEmitterLayer, with emitter: Confetti.Emitter)
    func setEmitterGeometry(_ caemitter: inout CAEmitterLayer, with emitter: Confetti.Emitter)
    func setEmitterMode(_ caemitter: inout CAEmitterLayer, with emitter: Confetti.Emitter)
    func setEmitterShape(_ caemitter: inout CAEmitterLayer, with emitter: Confetti.Emitter)
}

// MARK: - CAEmitterCell Default Implementation

extension ConfettiRenderer {
    func makeCACell(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
        cacell.beginTime = CACurrentMediaTime()
        setCellAcceleration(&cacell, cell: cell)
        setCellContent(&cacell, cell: cell)
        setCellEmission(&cacell, cell: cell)
        setCellScale(&cacell, cell: cell)
        setCellVelocity(&cacell, cell: cell)
        setCellLifetime(&cacell, cell: cell)
        setCellSpin(&cacell, cell: cell)
    }
    
    func setCellAcceleration(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
        cacell.xAcceleration = cell.acceleration.x
        cacell.yAcceleration = cell.acceleration.y
        cacell.zAcceleration = cell.acceleration.z
    }
    
    func setCellContent(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
        cacell.scale = cell.contents.scale
        cacell.contents = cell.contents.image
        cacell.contentsRect = cell.contents.rect
    }
    
    func setCellEmission(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
        cacell.emissionLongitude = cell.emission.longitude
        cacell.emissionLatitude = cell.emission.latitude
        cacell.emissionRange = cell.emission.range
    }
    
    func setCellScale(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
        cacell.scale = cell.scale.base
        cacell.scaleRange = cell.scale.range
        cacell.scaleSpeed = cell.scale.speed
    }
    
    func setCellVelocity(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
        cacell.velocity = cell.velocity.base
        cacell.velocityRange = cell.velocity.range
    }
    
    func setCellLifetime(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
        cacell.lifetime = cell.lifetime.base
        cacell.lifetimeRange = cell.lifetime.range
        cacell.birthRate = cell.lifetime.birthRate
    }
    
    func setCellSpin(_ cacell: inout CAEmitterCell, cell: Confetti.Cell) {
        cacell.spin = cell.spin.base
        cacell.spinRange = cell.spin.range
    }
}

// MARK: - CAEmitterLayer Default Implementation

extension ConfettiRenderer {
    func makeCAEmitter(_ caemitter: inout CAEmitterLayer, with emitter: Confetti.Emitter) {
        setEmitterCells(&caemitter, with: emitter)
        setEmitterGeometry(&caemitter, with: emitter)
        setEmitterMode(&caemitter, with: emitter)
        setEmitterShape(&caemitter, with: emitter)
    }
    
    func setEmitterCells(_ caemitter: inout CAEmitterLayer, with emitter: Confetti.Emitter) {
        caemitter.emitterCells = emitter.cells.map { cell in
            var cacell = CAEmitterCell()
            makeCACell(&cacell, cell: cell)
            return cacell
        }
    }

    func setEmitterGeometry(_ caemitter: inout CAEmitterLayer, with emitter: Confetti.Emitter) {
        caemitter.emitterSize = emitter.geometry.size
        caemitter.emitterPosition = emitter.geometry.position
    }

    func setEmitterMode(_ caemitter: inout CAEmitterLayer, with emitter: Confetti.Emitter) {
        caemitter.emitterMode = Confetti.Emitter.Mode.emitterMode(from: emitter.mode)
    }

    func setEmitterShape(_ caemitter: inout CAEmitterLayer, with emitter: Confetti.Emitter) {
        caemitter.emitterShape = Confetti.Emitter.Shape.emitterShape(from: emitter.shape)
    }
}

//
//  ConfettiView.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 10/7/25.
//

import UIKit

/// A `UIView` responsible for rendering and emitting confetti particles.
///
/// `ConfettiView` acts as a thin wrapper around `ConfettiLayer`, handling
/// its lifecycle and attaching it to the view’s backing layer. Upon
/// initialization, it immediately begins emitting particles using the
/// provided configuration.
public final class ConfettiView: UIView, @MainActor ConfettiEmitterDelegate {
    
    private let viewModel: ConfettiViewModel
    private let styles: [Confetti.Style]
    private var configurations: [Confetti.Configuration] {
        styles.map { style in
                .makeConfiguration(for: style, in: bounds)
        }
    }
    
    public init(
        style: Confetti.Style,
        viewModel: ConfettiViewModel
    ) {
        self.styles = [style]
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.viewModel.delegate = self
    }
    
    init(
        styles: [Confetti.Style],
        viewModel: ConfettiViewModel
    ) {
        self.styles = styles
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func emit() {
        for configuration in configurations {
            let cells = Array(repeating: CAEmitterCell(), count: configuration.emitter.cells.count)
            let emitters = makeConfetti(with: cells, in: bounds)
            
            emitters.map { emitter in
                layer.addSublayer(emitter)
                
                guard let animation = makeAnimation() else { return }
                
                let id = UUID().uuidString
                emitter.add(animation, forKey: id)
            }
        }
    }
    
    func makeConfetti(
        with cells: [CAEmitterCell],
        in rect: CGRect
    ) -> [CAEmitterLayer] {
        return configurations.map { configuration in
            return makeCAEmitter(with: configuration.emitter)
        }
    }
    
    func makeCACell(cell: Confetti.Cell) -> CAEmitterCell {
        let cacell = CAEmitterCell()
        cacell.beginTime = CACurrentMediaTime()
        cacell.xAcceleration = cell.acceleration.x
        cacell.yAcceleration = cell.acceleration.y
        cacell.zAcceleration = cell.acceleration.z
        cacell.scale = cell.scale.base
        cacell.contents = cell.contents.image
        cacell.contentsRect = cell.contents.rect
        cacell.contentsScale = cell.contents.scale
        cacell.emissionLongitude = cell.emission.longitude
        cacell.emissionLatitude = cell.emission.latitude
        cacell.emissionRange = cell.emission.range
        cacell.scaleRange = cell.scale.range
        cacell.scaleSpeed = cell.scale.speed
        cacell.velocity = cell.velocity.base
        cacell.velocityRange = cell.velocity.range
        cacell.lifetime = cell.lifetime.base
        cacell.lifetimeRange = cell.lifetime.range
        cacell.birthRate = cell.lifetime.birthRate
        cacell.spin = cell.spin.base
        cacell.spinRange = cell.spin.range
        
        return cacell
    }
    
    func makeCAEmitter(with emitter: Confetti.Emitter) -> CAEmitterLayer {
        let caemitter = CAEmitterLayer()
        caemitter.emitterSize = emitter.geometry.size
        caemitter.emitterPosition = emitter.geometry.position
        caemitter.emitterMode = Confetti.Emitter.Mode.emitterMode(from: emitter.mode)
        caemitter.emitterShape = Confetti.Emitter.Shape.emitterShape(from: emitter.shape)
        caemitter.emitterCells = emitter.cells.map { cell in
            return makeCACell(cell: cell)
        }
        
        return caemitter
    }
    
    public func makeAnimation() -> CABasicAnimation? {
        let animation = CABasicAnimation(keyPath: "birthRate")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 0.05
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        return animation
    }
}

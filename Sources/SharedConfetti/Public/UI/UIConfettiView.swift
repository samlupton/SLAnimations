//
//  UIConfettiView.swift
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
public final class UIConfettiView: UIView {
    
    private var configuration: Confetti.Configuration
    
    public init(configuration: Confetti.Configuration) {
        self.configuration = configuration
        super.init(frame: .zero)
        isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func emit() {
        let cells = Array(repeating: CAEmitterCell(), count: configuration.cells.count)
        let emitter = makeCAEmitter(with: configuration)
        
        layer.addSublayer(emitter)
        guard let animation = makeAnimation() else { return }
        
        let id = UUID().uuidString
        emitter.add(animation, forKey: id)
    }

    private func makeCACell(cell: Confetti.Cell) -> CAEmitterCell {
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
    
    private func makeCAEmitter(with configuration: Confetti.Configuration) -> CAEmitterLayer {
        let caemitter = CAEmitterLayer()
        caemitter.emitterSize = resolveSize(for: configuration.emitter.shape, in: bounds)
        caemitter.emitterPosition = CGPoint(x: bounds.midX, y: bounds.midY)
        caemitter.emitterMode = Confetti.Emitter.Mode.emitterMode(from: configuration.emitter.mode)
        caemitter.emitterShape = Confetti.Emitter.Shape.emitterShape(from: configuration.emitter.shape)
        caemitter.emitterCells = configuration.cells.map { cell in
            return makeCACell(cell: cell)
        }
        
        return caemitter
    }
    
    public func makeAnimation() -> CABasicAnimation? {
        let animation = CABasicAnimation(keyPath: "birthRate")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 0.15
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        return animation
    }
}

private extension UIConfettiView {
    func resolveSize(for shape: Confetti.Emitter.Shape, in rect: CGRect) -> CGSize {
        switch shape {
        case .point:
            return .zero
        case .line:
            return CGSize(width: rect.width, height: .zero)
        case .rectangle, .circle:
            let length = min(rect.width, rect.height)
            return CGSize(width: length, height: length)
        }
    }
}

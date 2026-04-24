//
//  PlumeUIView.swift
//  Plume
//
//  Created by Samuel Lupton on 10/7/25.
//

import UIKit

/// A `UIView` responsible for rendering and emitting plume particles.
///
/// `PlumeView` acts as a thin wrapper around `PlumeLayer`, handling
/// its lifecycle and attaching it to the view’s backing layer. Upon
/// initialization, it immediately begins emitting particles using the
/// provided configuration.
public final class PlumeUIView: UIView {
    
    private var configuration: Plume.Configuration
    
    public init(configuration: Plume.Configuration) {
        self.configuration = configuration
        super.init(frame: .zero)
        isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func emit() {
        let emitter = makeCAEmitter(with: configuration)
        
        layer.addSublayer(emitter)
        guard let animation = makeAnimation() else { return }
        
        let id = UUID().uuidString
        emitter.add(animation, forKey: id)
    }

    private func makeCACell(cell: Plume.Cell) -> CAEmitterCell {
        let cacell = CAEmitterCell()
        cacell.beginTime = CACurrentMediaTime()
        cacell.xAcceleration = cell.acceleration.x
        cacell.yAcceleration = cell.acceleration.y
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
        cacell.lifetime = Float(cell.lifetime.base)
        cacell.lifetimeRange = Float(cell.lifetime.range)
        cacell.birthRate = Float(cell.lifetime.birthRate)
        cacell.spin = cell.spin.base
        cacell.spinRange = cell.spin.range
        
        return cacell
    }
    
    private func makeCAEmitter(with configuration: Plume.Configuration) -> CAEmitterLayer {
        let caemitter = CAEmitterLayer()
        caemitter.emitterSize = resolveSize(for: configuration.emitter.shape, in: bounds)
        caemitter.emitterPosition = CGPoint(x: bounds.midX, y: bounds.midY)
        caemitter.emitterMode = Plume.Emitter.Mode.emitterMode(from: configuration.emitter.mode)
        caemitter.emitterShape = Plume.Emitter.Shape.emitterShape(from: configuration.emitter.shape)
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

private extension PlumeUIView {
    func resolveSize(for shape: Plume.Emitter.Shape, in rect: CGRect) -> CGSize {
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

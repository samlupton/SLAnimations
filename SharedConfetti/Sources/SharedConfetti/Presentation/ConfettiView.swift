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
public final class ConfettiView: UIView, @MainActor ConfettiGenerator {
    
    private let configuration: Confetti.Configuration
    
    public init(configuration: Confetti.Configuration = .shower) {
        self.configuration = configuration
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func emit() {
        let cells = makeCells()
        let emitter = makeConfetti(with: cells, in: self.frame)
        
        layer.addSublayer(emitter)
        
        guard let animation = makeAnimation() else { return }
        
        let id = UUID().uuidString
        emitter.add(animation, forKey: id)
    }
    
    public func makeConfetti(
        with cells: [CAEmitterCell],
        in rect: CGRect
    ) -> CAEmitterLayer {
        let emitter = CAEmitterLayer()
        emitter.birthRate = 1
        emitter.lifetime = 1
        emitter.emitterPosition = .init(x: rect.midX, y: .zero)
        emitter.emitterSize = .init(width: rect.width, height: .zero)
        emitter.emitterShape = .line
        emitter.emitterMode = .outline
        emitter.needsDisplayOnBoundsChange = true
        emitter.emitterCells = cells
        emitter.opacity = 0.5
        return emitter
    }
    
    public func makeCells() -> [CAEmitterCell] {
        return configuration.cells.map { cell in
            var cacell = CAEmitterCell()
            cacell.beginTime = CACurrentMediaTime()
            makeCACell(&cacell, cell: cell)
            return cacell
        }
    }
    
    public func makeAnimation() -> CABasicAnimation? {
        return nil
    }
}

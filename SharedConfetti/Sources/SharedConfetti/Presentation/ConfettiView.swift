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
public final class ConfettiView: UIView, @MainActor ConfettiRenderer, @MainActor ConfettiEmitterDelegate {
    
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
            var caemitter = CAEmitterLayer()
            let _emitter = configuration.emitter
            // TODO: Implement opacity method
            caemitter.opacity = configuration.opacity
            makeCAEmitter(&caemitter, with: _emitter)
            return caemitter
        }
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

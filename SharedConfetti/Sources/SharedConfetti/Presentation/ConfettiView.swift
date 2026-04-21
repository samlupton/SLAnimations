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
    private let style: Confetti.Style
    private var configuration: Confetti.Configuration {
        .makeConfiguration(for: style, in: bounds)
    }

    public init(
        style: Confetti.Style = .shower,
        viewModel: ConfettiViewModel
    ) {
        self.style = style
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.viewModel.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func emit() {
        let cells = Array(repeating: CAEmitterCell(), count: configuration.cells.count)
        let emitter = makeConfetti(with: cells, in: bounds)
        
        layer.addSublayer(emitter)
        
        guard let animation = makeAnimation() else { return }
        
        let id = UUID().uuidString
        emitter.add(animation, forKey: id)
    }
    
    func makeConfetti(
        with cells: [CAEmitterCell],
        in rect: CGRect
    ) -> CAEmitterLayer {
        var caemitter = CAEmitterLayer()
        let _emitter = configuration.emitter
        makeCAEmitter(&caemitter, with: _emitter)
        return caemitter
    }
    
    public func makeAnimation() -> CABasicAnimation? {
        return nil
    }
}

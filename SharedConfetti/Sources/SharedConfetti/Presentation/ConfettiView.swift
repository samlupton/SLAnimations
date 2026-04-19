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
public final class ConfettiView: UIView {
    
    private let generator: ConfettiGenerator
    
    public init(generator: Confetti.Configuration = .default) {
        self.generator = generator.makeConfiguration()
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func emit() {
        let cells = generator.makeCells()
        let emitter = generator.makeConfetti(with: cells, in: self.frame)
        
        layer.addSublayer(emitter)
        
        guard let animation = generator.makeAnimation() else { return }
        
        let id = UUID().uuidString
        emitter.add(animation, forKey: id)
    }
}

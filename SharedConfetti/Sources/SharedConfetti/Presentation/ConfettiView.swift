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
    
    private let configuration: Confetti
    
    public init(configuration: Confetti = .default) {
        self.configuration = configuration
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func emit() {
        let images = configuration.images
        let cells = configuration.generator.makeCells(with: configuration.images)
        let emitter = configuration.generator.makeConfetti(with: cells)
        let animation = configuration.generator.makeAnimation()
        
        let id = UUID().uuidString
        emitter.add(animation, forKey: id)
        
        layer.addSublayer(emitter)
    }
}

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
    
    func emit(in window: UIWindow?) {
        guard window != nil else { return }
        
        let images = configuration.images
        let cells = configuration.generator.makeCells(with: configuration.images)
        let emitter = configuration.generator.makeConfetti(with: cells)
        layer.addSublayer(configuration.generator.makeConfetti(with: cells))
        
        let id = UUID().uuidString
        emitter.add(getAnimation(), forKey: id)
    }
    
    private func getAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "birthRate")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 0.1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        return animation
    }
    
    func getPosition(for position: EmitterPosition, with window: UIWindow?) -> CGPoint {
        guard let window = window else {
            return CGPoint(x: 0, y: 0)
        }

        let bounds = window.bounds
        let midX = bounds.midX
        let midY = bounds.midY
        let maxX = bounds.maxX
        let maxY = bounds.maxY
        
        switch position {
        case .top:
            return CGPoint(x: midX, y: bounds.minY)
        case .leading:
            return CGPoint(x: bounds.minX, y: midY)
        case .trailing:
            return CGPoint(x: maxX, y: midY)
        case .bottom:
            return CGPoint(x: midX, y: maxY)
        case .center:
            return CGPoint(x: midX, y: midY)
        }
    }
}


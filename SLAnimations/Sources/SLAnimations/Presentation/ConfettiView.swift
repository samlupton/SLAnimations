//
//  ConfettiView.swift
//  ConfettiAnimation
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

    /// Configuration that defines how the emitter layer behaves,
    /// including position, shape, and particle properties.
    private let configuration: EmitterLayerConfiguration

    /// Creates a new `ConfettiView` with the given emitter configuration.
    ///
    /// - Parameter configuration: An object conforming to
    ///   `EmitterLayerConfiguration` that defines how particles are emitted.
    ///
    /// The view initializes with a zero frame and immediately starts emitting.
    public init(configuration: EmitterLayerConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        emit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Creates and attaches a `ConfettiLayer` to the view, then begins emission.
    ///
    /// This method:
    /// - Instantiates a `ConfettiLayer` using the current configuration
    /// - Adds it as a sublayer of the view’s backing layer
    /// - Triggers particle emission within the current window context
    ///
    /// Call this manually if you need to re-trigger the animation.
    public func emit() {
        let confettiLayer = ConfettiLayer(configuration: configuration)
        layer.addSublayer(confettiLayer)
        confettiLayer.emit(in: window)
    }
}

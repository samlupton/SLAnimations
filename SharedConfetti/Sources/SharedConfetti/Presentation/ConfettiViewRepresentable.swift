//
//  ConfettiViewRepresentable.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 10/9/25.
//

import SwiftUI

/// A SwiftUI wrapper for `ConfettiView` that enables use within SwiftUI layouts.
///
/// `ConfettiViewRepresentable` bridges the UIKit-based `ConfettiView` into SwiftUI
/// using `UIViewRepresentable`. It allows you to embed and configure confetti
/// animations declaratively while still leveraging the underlying UIKit implementation.
///
/// Use this when integrating confetti effects into SwiftUI views, especially when
/// you want to trigger animations in response to state changes or user interaction.
///
/// - Note:
///   This view does not automatically trigger the animation. You are responsible
///   for calling `emit()` on the underlying `ConfettiView` when appropriate.
public struct ConfettiViewRepresentable: UIViewRepresentable {
    
    /// The configuration used to construct the underlying `ConfettiView`.
    private let configuration: EmitterLayerConfiguration
    
    /// Creates a SwiftUI-compatible confetti view.
    ///
    /// - Parameter configuration: The emitter configuration defining how particles
    ///   are generated and displayed.
    public init(configuration: EmitterLayerConfiguration) {
        self.configuration = configuration
    }

    /// Creates the underlying `ConfettiView`.
    public func makeUIView(context: Context) -> ConfettiView {
        ConfettiView(configuration: configuration)
    }
    
    /// Updates the underlying view when SwiftUI state changes.
    ///
    /// This implementation is intentionally empty since the configuration is static.
    /// If dynamic updates are needed, this method can be extended to reconfigure
    /// or trigger animations.
    public func updateUIView(_ uiView: ConfettiView, context: Context) {}
}

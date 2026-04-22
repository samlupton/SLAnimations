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

    let viewModel: ConfettiViewModel
    
    public init(viewModel: ConfettiViewModel) {
        self.viewModel = viewModel
    }

    /// Creates the underlying `ConfettiView`.
    public func makeUIView(context: Context) -> ConfettiView {
        ConfettiView(viewModel: viewModel)
    }
    
    /// Updates the underlying view when SwiftUI state changes.
    ///
    /// This implementation is intentionally empty since the configuration is static.
    /// If dynamic updates are needed, this method can be extended to reconfigure
    /// or trigger animations.
    public func updateUIView(_ uiView: ConfettiView, context: Context) {}
}

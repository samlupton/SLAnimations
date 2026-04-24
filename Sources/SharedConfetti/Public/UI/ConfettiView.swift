//
//  ConfettiView.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 10/9/25.
//

import SwiftUI

/// A SwiftUI wrapper for `UIConfettiView` that enables use within SwiftUI layouts.
///
/// `ConfettiView` bridges the UIKit-based `UIConfettiView` into SwiftUI
/// using `UIViewRepresentable`. It allows you to embed and configure confetti
/// animations declaratively while still leveraging the underlying UIKit implementation.
///
/// Use this when integrating confetti effects into SwiftUI views, especially when
/// you want to trigger animations in response to state changes or user interaction.
///
/// - Note:
///   This view does not automatically trigger the animation. You are responsible
///   for calling `emit()` on the underlying `ConfettiView` when appropriate.
public struct ConfettiView: UIViewRepresentable {
    let configuration: Confetti.Configuration
    let trigger: Int
    
    public init(configuration: Confetti.Configuration, trigger: Int) {
        self.configuration = configuration
        self.trigger = trigger
    }

    public func makeUIView(context: Context) -> UIConfettiView {
        UIConfettiView(configuration: configuration)
    }

    public func updateUIView(_ uiView: UIConfettiView, context: Context) {
        if context.coordinator.lastTrigger != trigger {
            context.coordinator.lastTrigger = trigger
            uiView.emit()
        }
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    public final class Coordinator {
        var lastTrigger: Int = 0
    }
}

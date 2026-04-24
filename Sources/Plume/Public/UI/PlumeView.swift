//
//  PlumeView.swift
//  Plume
//
//  Created by Samuel Lupton on 10/9/25.
//

import SwiftUI

/// A SwiftUI wrapper for `UIPlumeView` that enables use within SwiftUI layouts.
///
/// `PlumeView` bridges the UIKit-based `UIPlumeView` into SwiftUI
/// using `UIViewRepresentable`. It allows you to embed and configure plume
/// animations declaratively while still leveraging the underlying UIKit implementation.
///
/// Use this when integrating plume effects into SwiftUI views, especially when
/// you want to trigger animations in response to state changes or user interaction.
///
/// - Note:
///   This view does not automatically trigger the animation. You are responsible
///   for calling `emit()` on the underlying `PlumeView` when appropriate.
public struct PlumeView: UIViewRepresentable {
    let configuration: Plume.Configuration
    let trigger: Int
    
    public init(configuration: Plume.Configuration, trigger: Int) {
        self.configuration = configuration
        self.trigger = trigger
    }

    public func makeUIView(context: Context) -> UIPlumeView {
        UIPlumeView(configuration: configuration)
    }

    public func updateUIView(_ uiView: UIPlumeView, context: Context) {
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

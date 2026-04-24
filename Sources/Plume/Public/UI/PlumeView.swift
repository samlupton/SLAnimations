//
//  PlumeView.swift
//  Plume
//
//  Created by Samuel Lupton on 10/9/25.
//

import SwiftUI

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

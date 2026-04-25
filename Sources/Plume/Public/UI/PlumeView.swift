//
//  PlumeView.swift
//  Plume
//
//  Created by Samuel Lupton on 10/9/25.
//

import SwiftUI

public struct PlumeView: UIViewRepresentable {
    var plume: Plume
    let trigger: Int
    
    public init(plume: Plume, trigger: Int) {
        self.plume = plume
        self.trigger = trigger
    }

    public func makeUIView(context: Context) -> PlumeUIView {
        PlumeUIView(plume: plume)
    }

    public func updateUIView(_ uiView: PlumeUIView, context: Context) {
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

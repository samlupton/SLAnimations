//
//  UIApplication+Extensions.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/2/25.
//

import SwiftUI

// MARK: Emitter function
extension View {
    func getTopWindow() -> UIWindow? {
        let windowScene = UIApplication
            .shared
            .connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene
        let window = windowScene?.keyWindow
        return window
    }
    
    func emitConfetti(configuration: ConfettiConfiguration = .cannon) {
        guard let window = getTopWindow() else {
            return
        }

        let layer = ConfettiLayer(configuration: configuration.model)
        layer.frame = window.bounds
        window.layer.addSublayer(layer)
        layer.emit()
    }
}

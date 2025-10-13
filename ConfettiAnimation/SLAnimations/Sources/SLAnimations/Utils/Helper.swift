//
//  Helper.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/12/25.
//

import UIKit

@MainActor
private func getTopWindow() -> UIWindow? {
    let windowScene = UIApplication
        .shared
        .connectedScenes
        .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene
    let window = windowScene?.keyWindow
    return window
}

@MainActor
public func emitConfetti(with confettiView: ConfettiView) {
    guard let window = getTopWindow() else {
        return
    }
    window.rootViewController?.view.superview?.addSubview(confettiView)
    confettiView.emit()
}

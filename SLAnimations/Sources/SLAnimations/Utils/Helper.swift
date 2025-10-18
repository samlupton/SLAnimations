//
//  Helper.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/12/25.
//

//import UIKit
//
@MainActor
private func getTopWindow() -> UIWindow? {
    let windowScenes = UIApplication.shared.connectedScenes
        .compactMap { $0 as? UIWindowScene }
        .filter { $0.activationState == .foregroundActive }

    return windowScenes
        .flatMap { $0.windows }
        .last { $0.isKeyWindow || $0.windowLevel == .normal }
}
//
//@MainActor
//public func emitConfetti(with confettiView: ConfettiView) {
//    guard let window = getTopWindow() else { return }
//    confettiView.frame = window.bounds
//    window.addSubview(confettiView)
//    confettiView.emit()
//}

import UIKit

//@MainActor
//private func getTopWindow() -> UIWindow? {
//    let windowScene = UIApplication
//        .shared
//        .connectedScenes
//        .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene
//    let window = windowScene?.keyWindow
//    return window
//}

@MainActor
public func emitConfetti(with confettiView: ConfettiView) {
    guard let window = getTopWindow() else {
        return
    }
    window.rootViewController?.view.superview?.addSubview(confettiView)
    confettiView.emit()
}

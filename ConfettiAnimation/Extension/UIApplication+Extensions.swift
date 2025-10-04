//
//  UIApplication+Extensions.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/2/25.
//

import UIKit

extension UIApplication {
    func topViewController(
        base: UIViewController? = UIApplication.shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }?.rootViewController
    ) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}

extension UIApplication {
    @MainActor
    func emitConfetti(configuration: ConfettiConfiguration = .cannon) {
        print("Entered emitConfetti")
        guard
            let topViewController = topViewController()?.view.superview
        else {
            print("topViewController is nil")
            return
        }
        print("passes the guard check")
        let layer = ConfettiLayer()
        let confettiView = Confetti(confettiLayer: layer, configuration: configuration)
        confettiView.frame = topViewController.bounds
        confettiView.isUserInteractionEnabled = false

        topViewController.addSubview(confettiView)

        confettiView.confettiLayer.emit()

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            print("removed from superview was called")
            confettiView.removeFromSuperview()
        }
    }
}

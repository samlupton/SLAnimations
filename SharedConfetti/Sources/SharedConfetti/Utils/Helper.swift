//
//  Helper.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 10/12/25.
//

import UIKit

// MARK: - Top Window

/// Helper method used to get the top window of the application. The confetti animation can be rendered such that it overlays the entire application view.
private extension UIWindow {
    static func getTopWindow(
        at level: UIWindow.Level = .normal
    ) -> UIWindow? {
        let windowScenes = UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .filter { $0.activationState == .foregroundActive }
        
        return windowScenes
            .flatMap { $0.windows }
            .last { $0.isKeyWindow || $0.windowLevel == level }
    }
}

///
/// This function finds the top-most active `UIWindow`, attaches the provided
/// `ConfettiView` to it, and triggers its emission animation.
///
/// The view is sized to match the window bounds and ignores user interaction
/// so it does not block touches to underlying UI.
///
/// - Important:
///   This must be called on the main actor because it performs UIKit view hierarchy updates.
///   The function safely no-ops if no active window can be found.
///
/// - Parameter confettiView: A preconfigured `ConfettiView` instance that will be
///   added to the window and animated.
@MainActor public func emitConfetti(style: Confetti.Style) {
    guard let window = UIWindow.getTopWindow() else { return }

    let confettiView = ConfettiView(style: style, viewModel: ConfettiViewModel())
    confettiView.frame = window.bounds
    confettiView.isUserInteractionEnabled = false
    
    window.addSubview(confettiView)
    
    confettiView.emit()
}

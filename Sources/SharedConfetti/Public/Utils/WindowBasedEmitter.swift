//
//  WindowBasedEmitter.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 10/12/25.
//

import UIKit

public extension UIWindow {
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
    @MainActor static func emitConfetti(style: Confetti.Style) {
        guard let window = UIWindow.getTopWindow() else { return }
        
        let confettiView = UIConfettiView(styles: [style])        
        confettiView.frame = window.bounds
        confettiView.isUserInteractionEnabled = false
        
        window.addSubview(confettiView)
        
        confettiView.emit()
    }
}

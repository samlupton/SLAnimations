//
//  WindowLookup.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 4/22/26.
//

import UIKit

// MARK: - Top Window

/// Helper method used to get the top window of the application. The confetti animation can be rendered such that it overlays the entire application view.
internal extension UIWindow {
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

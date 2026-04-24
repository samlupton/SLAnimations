//
//  WindowBasedEmitter.swift
//  Plume
//
//  Created by Samuel Lupton on 10/12/25.
//

import UIKit

public extension UIWindow {
    /// This function finds the top-most active `UIWindow`, attaches the provided
    /// `PlumeView` to it, and triggers its emission animation.
    ///
    /// The view is sized to match the window bounds and ignores user interaction
    /// so it does not block touches to underlying UI.
    ///
    /// - Important:
    ///   This must be called on the main actor because it performs UIKit view hierarchy updates.
    ///   The function safely no-ops if no active window can be found.
    ///
    /// - Parameter plumeView: A preconfigured `PlumeView` instance that will be
    ///   added to the window and animated.
    @MainActor static func emitPlume(configuration: Plume.Configuration) {
        guard let window = UIWindow.getTopWindow() else { return }
        
        let plumeView = UIPlumeView(configuration: configuration)        
        plumeView.frame = window.bounds
        plumeView.isUserInteractionEnabled = false
        
        window.addSubview(plumeView)
        
        plumeView.emit()
    }
}

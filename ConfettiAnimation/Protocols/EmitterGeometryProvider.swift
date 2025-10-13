//
//  EmitterGeometryProvider.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/12/25.
//

import UIKit

protocol EmitterGeometryProvider {
    /// Returns the position for the emitter layer based the window context
    /// - Parameters:
    ///     - position: The postion of the emitter layer
    ///     - window: The window of which the emitter layer will be used in
    func getPosition(for position: EmitterPosition, with window: UIWindow?) -> CGPoint
}

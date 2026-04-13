//
//  ConfettiImageRenderer.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 9/30/25.
//

import SwiftUI

// MARK: Confetti Particles
public struct ConfettiImageRenderer: Sendable {
    private let confettiColors: [Color] = [
        Color(red: 1.00, green: 0.42, blue: 0.42),
        Color(red: 1.00, green: 0.85, blue: 0.24),
        Color(red: 0.42, green: 0.80, blue: 0.47),
        Color(red: 0.30, green: 0.59, blue: 1.00),
        Color(red: 0.62, green: 0.30, blue: 0.87),
        Color(red: 1.00, green: 0.62, blue: 0.11),
        Color(red: 1.00, green: 0.71, blue: 0.91),
        Color(red: 0.22, green: 0.69, blue: 0.00)
    ]
    
    public init() {}

    @MainActor public func getConfettiParticles(scale: Double = 10.0) -> [UIImage] {
        var result: [UIImage] = []
        
        for color in confettiColors {
            let particle = ConfettiParticleView(color: color, scale: scale)
            let renderer = ImageRenderer(content: particle)
            
            if let particle = renderer.uiImage {
                result.append(particle)
            }
        }
        
        return result
    }
}

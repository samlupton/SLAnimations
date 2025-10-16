//
//  ConfettiImageRenderer.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 9/30/25.
//

import SwiftUI

// MARK: Confetti Particles
@MainActor
struct ConfettiImageRenderer {
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

    func getConfettiParticles(scale: Double = 10.0) -> [UIImage] {
        var res = [UIImage]()
        
        for color in confettiColors {
            let particle = ConfettiPiece(color: color, scale: scale)
            let renderer = ImageRenderer(content: particle)
            
            if let particle = renderer.uiImage {
                res.append(particle)
            }
        }
        
        return res
    }
}

// MARK: Fire Particles
extension ConfettiImageRenderer {
    private static let fireColors: [Color] = [
        Color(red: 1.00, green: 0.80, blue: 0.00),
        Color(red: 1.00, green: 0.55, blue: 0.00),
        Color(red: 1.00, green: 0.30, blue: 0.00),
        Color(red: 0.85, green: 0.10, blue: 0.00),
        Color(red: 1.00, green: 0.95, blue: 0.00)
    ]
    
    func getFireParticles(scale: Double = 10.0) -> [UIImage] {
        var res = [UIImage]()
        
        for color in ConfettiImageRenderer.fireColors {
            let particle = FirePeice(color: color, scale: scale)
            let renderer = ImageRenderer(content: particle)
            
            if let particle = renderer.uiImage {
                res.append(particle)
            }
        }
        
        return res
    }
}

//
//  ConfettiImageRenderer.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 9/30/25.
//

import SwiftUI

public struct ConfettiImageRenderer<Particle: View>: Sendable where Particle: Sendable {

    public let particle: Particle
    
    public init(particle: Particle) {
        self.particle = particle
    }

    @MainActor public func getConfettiParticles(scale: Double = 10.0) -> [UIImage] {
        var result: [UIImage] = []
        
        let renderer = ImageRenderer(content: particle)
        
        if let particle = renderer.uiImage {
            result.append(particle)
        }
        
        return result
    }
}

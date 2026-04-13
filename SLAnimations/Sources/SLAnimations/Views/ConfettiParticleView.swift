//
//  ConfettiPiece.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 9/25/25.
//

import SwiftUI

/// A view that represents a single peice of confetti.
internal struct ConfettiParticleView: View {
    /// The color off the peice of confetti.
    let color: Color
    
    /// A scalar value that adjust the size of the confetti peice.
    let scale: Double
    
    /// A static range used to randomize the size of the confetti peice by +/- 10%.
    private static let scatterRange: ClosedRange<Double> = 0.90...1.10
    
    /// A value used to scatter the position of a particular corner or control point of the confetti peice.
    private let scatter1 = Double.random(in: scatterRange)
    
    /// A value used to scatter the position of a particular corner or control point of the confetti peice.
    private let scatter2 = Double.random(in: scatterRange)
    
    /// A value used to scatter the position of a particular corner or control point of the confetti peice.
    private let scatter3 = Double.random(in: scatterRange)
    
    /// A value used to scatter the position of a particular corner or control point of the confetti peice.
    private let scatter4 = Double.random(in: scatterRange)
    
    /// A value used to scatter the position of a particular corner or control point of the confetti peice.
    private let scatter5 = Double.random(in: scatterRange)
    
    /// A value used to scatter the position of a particular corner or control point of the confetti peice.
    private let scatter6 = Double.random(in: scatterRange)
    
    /// A value used to scatter the position of a particular corner or control point of the confetti peice.
    private let scatter7 = Double.random(in: scatterRange)
    
    /// A value used to scatter the position of a particular corner or control point of the confetti peice.
    private let scatter8 = Double.random(in: scatterRange)

    var body: some View {
        VStack {
            Path { path in
                path.move(
                    to: CGPoint(x: 0 * scale * scatter1, y: 0.6 * scale * scatter2)
                )
                path.addQuadCurve(
                    to: CGPoint(x: 1.8 * scale * scatter3, y: 1.9 * scale * scatter4),
                    control: CGPoint(x: 0.6 * scale, y: 1.7 * scale)
                )
                path.addLine(
                    to: CGPoint(x: 2.1 * scale * scatter5, y: 0.9 * scale * scatter6)
                )
                path.addQuadCurve(
                    to: CGPoint(x: 0.6 * scale * scatter7, y: 0 * scale * scatter8),
                    control: CGPoint(x: 1.1 * scale, y: 0.7 * scale)
                )
            }
            .fill(color)
        }
        .frame(
            width: 2.1 * scale,
            height: 1.9 * scale
        )
    }
}

//
//  ConfettiPiece.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 9/25/25.
//

import SwiftUI

struct ConfettiPiece: View {
    
    let color: Color
    let scale: Double
    
    init(color: Color, scale: Double) {
        self.color = color
        self.scale = scale
    }
    
    private static let scatterRange: ClosedRange<Double> = 0.90...1.10
    
    private let scatter1 = Double.random(in: scatterRange)
    private let scatter2 = Double.random(in: scatterRange)
    private let scatter3 = Double.random(in: scatterRange)
    private let scatter4 = Double.random(in: scatterRange)
    private let scatter5 = Double.random(in: scatterRange)
    private let scatter6 = Double.random(in: scatterRange)
    private let scatter7 = Double.random(in: scatterRange)
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
        .frame(width: 2.1 * scale, height: 1.9 * scale)
    }
}

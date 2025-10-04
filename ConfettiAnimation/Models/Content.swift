//
//  Content.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 9/25/25.
//

import SwiftUI

struct ConfettiPiece: View {
    
    let color: Color

    let scale = 30.0
    
    static let scatterRange: ClosedRange<Double> = 0.90...1.10
    
    let scatter1 = Double.random(in: scatterRange)
    let scatter2 = Double.random(in: scatterRange)
    let scatter3 = Double.random(in: scatterRange)
    let scatter4 = Double.random(in: scatterRange)
    let scatter5 = Double.random(in: scatterRange)
    let scatter6 = Double.random(in: scatterRange)
    let scatter7 = Double.random(in: scatterRange)
    let scatter8 = Double.random(in: scatterRange)

    var body: some View {
        Path { path in
            path.move(
                to: CGPoint(x: 1 * scale * scatter1, y: 2 * scale * scatter2)
            )
            path.addQuadCurve(
                to: CGPoint(x: 2.8 * scale * scatter3, y: 3.3 * scale * scatter4),
                control: CGPoint(x: 1.6 * scale, y: 3.1 * scale)
            )
            path.addLine(
                to: CGPoint(x: 3.1 * scale * scatter5, y: 2.3 * scale * scatter6)
            )
            path.addQuadCurve(
                to: CGPoint(x: 1.6 * scale * scatter7, y: 1.4 * scale * scatter8),
                control: CGPoint(x: 2.1 * scale, y: 2.1 * scale)
            )
        }
        .fill(color)
    }
}


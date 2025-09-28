//
//  Content.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 9/25/25.
//

import SwiftUI

enum Content {
    enum Shape {
        case peice
    }
    case shape(Shape, UIColor)
}

struct ConfettiPiece: View {
    
    let confettiColors: [Color] = [
        Color(red: 1.00, green: 0.42, blue: 0.42),
        Color(red: 1.00, green: 0.85, blue: 0.24),
        Color(red: 0.42, green: 0.80, blue: 0.47),
        Color(red: 0.30, green: 0.59, blue: 1.00),
        Color(red: 0.62, green: 0.30, blue: 0.87),
        Color(red: 1.00, green: 0.62, blue: 0.11),
        Color(red: 1.00, green: 0.71, blue: 0.91),
        Color(red: 0.22, green: 0.69, blue: 0.00)
    ]

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
        .fill(confettiColors.randomElement() ?? .black)
    }
}

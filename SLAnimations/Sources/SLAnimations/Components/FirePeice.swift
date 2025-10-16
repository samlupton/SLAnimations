//
//  FirePeice.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/12/25.
//

import SwiftUI

struct FirePeice: View {
    
    let color: Color
    let scale: Double

    init(color: Color, scale: Double) {
        self.color = color
        self.scale = scale
    }

    var body: some View {
        Path { path in
            path.addEllipse(in: CGRect(x: 0, y: 0, width: scale, height: scale))
        }
        .fill(color)
        .frame(width: scale, height: scale)
    }
}

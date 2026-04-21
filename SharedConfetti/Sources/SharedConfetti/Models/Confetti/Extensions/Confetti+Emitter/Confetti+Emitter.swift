//
//  Confetti+Emitter.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/20/26.
//

import QuartzCore

public extension Confetti {
    struct Emitter: Sendable {
        var geometry: Confetti.Emitter.Geometry
        var shape: Confetti.Emitter.Shape
        var mode: Confetti.Emitter.Mode
        var cells: [Cell]
    }
}

extension Confetti.Emitter {
    static func fountain(in rect: CGRect) -> Self {
        let contents = Confetti.Cell.makeFountainCells(
            with: Confetti.Cell.Contents.makeFountainContents()
        )
        
        let geometry: Geometry = .init(position: .init(x: rect.midX, y: rect.maxY), size: rect.size)
        
        return .init(
            geometry: geometry,
            shape: .point,
            mode: .outline,
            cells: contents
        )
    }
}

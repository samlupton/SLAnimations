//
//  Confetti+Emitter.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/20/26.
//

import CoreFoundation

public extension Confetti {
    struct Emitter: Sendable {
        var geometry: Confetti.Emitter.Geometry
        var shape: Confetti.Emitter.Shape
        var mode: Confetti.Emitter.Mode
        var cells: [Cell]
    }
}

extension Confetti.Emitter {
    internal static func fountain(in rect: CGRect) -> Self {
        let contents = Confetti.Cell.Contents.makeFountainContents()
        let cells = Confetti.Cell.makeFountainCells(with: contents)
        let geometry: Geometry = .init(position: .init(x: rect.midX, y: rect.maxY), size: rect.size)
        let shape: Self.Shape = .point
        let mode: Self.Mode = .outline

        return .init(
            geometry: geometry,
            shape: shape,
            mode: mode,
            cells: cells
        )
    }
    
    internal static func shower(in rect: CGRect) -> Self {
        let contents = Confetti.Cell.Contents.makeShowerContents()
        let cells = Confetti.Cell.makeShowerCells(with: contents)
        let geometry: Geometry = .init(position: .init(x: rect.midX, y: rect.minY), size: rect.size)
        let shape: Self.Shape = .line
        let mode: Self.Mode = .outline

        return .init(
            geometry: geometry,
            shape: shape,
            mode: mode,
            cells: cells
        )
    }
}

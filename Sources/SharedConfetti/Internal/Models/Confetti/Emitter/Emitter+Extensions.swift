//
//  Confetti+Emitter+Extensions.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 4/22/26.
//

import CoreFoundation

internal extension Confetti.Emitter {
    static func makeFountainEmitter(in rect: CGRect) -> Self {
        let geometry: Geometry = .init(position: .init(x: rect.midX, y: rect.maxY), size: rect.size)
        let shape: Self.Shape = .point
        let mode: Self.Mode = .outline

        return .init(
            geometry: geometry,
            shape: shape,
            mode: mode
        )
    }
    
    static func makeShowerEmitter(in rect: CGRect) -> Self {
        let geometry: Geometry = .init(position: .init(x: rect.midX, y: rect.minY), size: rect.size)
        let shape: Self.Shape = .line
        let mode: Self.Mode = .outline

        return .init(
            geometry: geometry,
            shape: shape,
            mode: mode
        )
    }
    
    static func makeLeftCannonEmitter(in rect: CGRect) -> Self {
        let geometry: Geometry = .init(
            position: .init(x: rect.minX, y: rect.midY),
            size: .init(width: 50, height: 50)
        )
        let shape: Self.Shape = .circle
        let mode: Self.Mode = .surface

        return .init(
            geometry: geometry,
            shape: shape,
            mode: mode
        )
    }
    
    static func makeRightCannonEmitter(in rect: CGRect) -> Self {
        let geometry: Geometry = .init(
            position: .init(x: rect.maxX, y: rect.midY),
            size: .init(width: 50, height: 50)
        )
        let shape: Self.Shape = .circle
        let mode: Self.Mode = .surface

        return .init(
            geometry: geometry,
            shape: shape,
            mode: mode
        )
    }
}

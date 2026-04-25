//
//  Angle+Extensions.swift
//  Plume
//
//  Created by Samuel Lupton on 4/25/26.
//

// MARK: - Cardinal Angle

public extension Plume.Cell.Angle {
    static let right: Self = Plume.Cell.Angle(base: 0, range: .pi / 8)
    static let left: Self = Plume.Cell.Angle(base: .pi, range: .pi / 8)
    static let up: Self = Plume.Cell.Angle(base: -(.pi / 2), range: .pi / 8)
    static let down: Self = Plume.Cell.Angle(base: .pi / 2, range: .pi / 8)
}

// MARK: - Diagonals Angle

public extension Plume.Cell.Angle {
    static let upRight: Self = Plume.Cell.Angle(base: -(.pi / 4), range: .pi / 8)
    static let upLeft: Self = Plume.Cell.Angle(base: -(.pi * 3 / 4), range: .pi / 8)
    static let downRight: Self = Plume.Cell.Angle(base: .pi / 4, range: .pi / 8)
    static let downLeft: Self = Plume.Cell.Angle(base: .pi * 3 / 4, range: .pi / 8)
}

// MARK: - Hemispheres Angle

public extension Plume.Cell.Angle {
    static let topHemisphere: Self = Plume.Cell.Angle(base: -(.pi / 2), range: .pi / 2)
    static let bottomHemisphere: Self = Plume.Cell.Angle(base: .pi / 2, range: .pi / 2)
    static let leftHemisphere: Self = Plume.Cell.Angle(base: .pi, range: .pi / 2)
    static let rightHemisphere: Self = Plume.Cell.Angle(base: 0, range: .pi / 2)
}

// MARK: - Fill

public extension Plume.Cell.Angle {
    static let radial: Self = Plume.Cell.Angle(base: 0, range: .pi)
}

//
//  Angle+Constants.swift
//  Plume
//
//  Created by Samuel Lupton on 4/25/26.
//

// MARK: - Cardinal Angle

public extension Plume.Cell.Angle {
    /// Rightward emission with slight angular variance for natural spread.
    static let right: Self = Plume.Cell.Angle(base: 0, range: .pi / 8)

    /// Leftward emission with slight angular variance for natural spread.
    static let left: Self = Plume.Cell.Angle(base: .pi, range: .pi / 8)

    /// Upward emission with slight angular variance.
    static let up: Self = Plume.Cell.Angle(base: -(.pi / 2), range: .pi / 8)

    /// Downward emission with slight angular variance.
    static let down: Self = Plume.Cell.Angle(base: .pi / 2, range: .pi / 8)
}

// MARK: - Diagonal Angles

public extension Plume.Cell.Angle {
    /// Up-right emission with directional spread.
    static let upRight: Self = Plume.Cell.Angle(base: -(.pi / 4), range: .pi / 8)

    /// Up-left emission with directional spread.
    static let upLeft: Self = Plume.Cell.Angle(base: -(.pi * 3 / 4), range: .pi / 8)

    /// Down-right emission with directional spread.
    static let downRight: Self = Plume.Cell.Angle(base: .pi / 4, range: .pi / 8)

    /// Down-left emission with directional spread.
    static let downLeft: Self = Plume.Cell.Angle(base: .pi * 3 / 4, range: .pi / 8)
}

// MARK: - Hemispheres

public extension Plume.Cell.Angle {
    /// Broad upward emission covering a wide arc (top half-space).
    static let topHemisphere: Self = Plume.Cell.Angle(base: -(.pi / 2), range: .pi / 2)

    /// Broad downward emission covering a wide arc (bottom half-space).
    static let bottomHemisphere: Self = Plume.Cell.Angle(base: .pi / 2, range: .pi / 2)

    /// Broad leftward emission covering a wide arc.
    static let leftHemisphere: Self = Plume.Cell.Angle(base: .pi, range: .pi / 2)

    /// Broad rightward emission covering a wide arc.
    static let rightHemisphere: Self = Plume.Cell.Angle(base: 0, range: .pi / 2)
}

// MARK: - Full Distribution

public extension Plume.Cell.Angle {
    /// Full circular emission with no directional bias.
    static let radial: Self = Plume.Cell.Angle(base: 0, range: .pi)
}

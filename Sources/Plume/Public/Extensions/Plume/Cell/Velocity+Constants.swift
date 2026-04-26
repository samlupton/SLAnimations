//
//  Velocity+Constants.swift
//  Plume
//
//  Created by Samuel Lupton on 4/25/26.
//

// MARK: - Inactive

extension Plume.Cell.Velocity {
    /// No movement. Particles remain stationary aside from other forces.
    public static let none: Self = Plume.Cell.Velocity(base: .zero, range: .zero)
}

// MARK: - Subtle Motion

extension Plume.Cell.Velocity {
    /// Barely perceptible movement, suitable for ambient effects.
    public static let gentle: Self = Plume.Cell.Velocity(base: 30, range: 8)
}

// MARK: - Standard Motion

extension Plume.Cell.Velocity {
    /// Balanced default motion for most effects.
    public static let standard: Self = Plume.Cell.Velocity(base: 100, range: 25)
}

// MARK: - Energetic Motion

extension Plume.Cell.Velocity {
    /// Clearly visible motion with strong presence.
    public static let lively: Self = Plume.Cell.Velocity(base: 200, range: 60)
}

// MARK: - High-Intensity Motion

extension Plume.Cell.Velocity {
    /// Fast, forceful movement for dramatic or high-impact effects.
    public static let explosive: Self = Plume.Cell.Velocity(base: 400, range: 150)
}

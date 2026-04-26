//
//  Velocity+Constants.swift
//  Plume
//
//  Created by Samuel Lupton on 4/25/26.
//

// MARK: - Inactive

public extension Plume.Cell.Velocity {
    /// No movement. Particles remain stationary aside from other forces.
    static let none: Self = .init(base: .zero, range: .zero)
}

// MARK: - Subtle Motion

public extension Plume.Cell.Velocity {
    /// Barely perceptible movement, suitable for ambient effects.
    static let gentle: Self = .init(base: 30, range: 8)
}

// MARK: - Standard Motion

public extension Plume.Cell.Velocity {
    /// Balanced default motion for most effects.
    static let standard: Self = .init(base: 100, range: 25)
}

// MARK: - Energetic Motion

public extension Plume.Cell.Velocity {
    /// Clearly visible motion with strong presence.
    static let lively: Self = .init(base: 200, range: 60)
}

// MARK: - High-Intensity Motion

public extension Plume.Cell.Velocity {
    /// Fast, forceful movement for dramatic or high-impact effects.
    static let explosive: Self = .init(base: 400, range: 150)
}

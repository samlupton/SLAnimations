//
//  Plume+Spin.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

// MARK: - Static Presets

extension Plume.Cell.Spin {
    /// No rotational motion.
    static let none = Plume.Cell.Spin(base: 0, range: 0)

    // MARK: - Subtle Motion

    /// Barely perceptible rotation.
    static let subtle = Plume.Cell.Spin(base: 0.2, range: 0.1)

    /// Gentle, natural rotation.
    static let gentle = Plume.Cell.Spin(base: 0.8, range: 0.3)

    // MARK: - Standard Motion

    /// Balanced default rotation for most effects.
    static let normal = Plume.Cell.Spin(base: 1.5, range: 0.6)

    // MARK: - Energetic Motion

    /// Noticeable, expressive spin.
    static let lively = Plume.Cell.Spin(base: 3.0, range: 1.0)

    /// Fast, high-energy rotation.
    static let fast = Plume.Cell.Spin(base: 5.0, range: 2.0)

    // MARK: - High Variance Motion

    /// Highly energetic, unstable but intentional motion.
    static let frenetic = Plume.Cell.Spin(base: 8.0, range: 4.0)
}

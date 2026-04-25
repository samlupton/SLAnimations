//
//  Velocity+Extensions.swift
//  Plume
//
//  Created by Samuel Lupton on 4/25/26.
//

// MARK: - Constants

public extension Plume.Cell.Velocity {
    static let none: Self = .init(base: .zero, range: .zero)

    /// Subtle, barely moving
    static let gentle: Self = .init(base: 30, range: 8)

    /// Natural baseline motion
    static let standard: Self = .init(base: 100, range: 25)

    /// Noticeably energetic
    static let lively: Self = .init(base: 200, range: 60)

    /// Explosive / high-energy bursts
    static let explosive: Self = .init(base: 400, range: 150)
}

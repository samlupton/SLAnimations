//
//  Plume+Acceleration+Extensions.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

// MARK: - Base

public extension Plume.Cell.Acceleration {
    static let none: Self = Plume.Cell.Acceleration(x: 0, y: 0)
}

// MARK: - Gravity (downward)

public extension Plume.Cell.Acceleration {
    static let gravityLight: Self = Plume.Cell.Acceleration(x: 0, y: 100)
    static let gravity: Self = Plume.Cell.Acceleration(x: 0, y: 300)
    static let gravityHeavy: Self = Plume.Cell.Acceleration(x: 0, y: 800)
}

// MARK: - Lift (upward)

public extension Plume.Cell.Acceleration {
    static let liftLight: Self = Plume.Cell.Acceleration(x: 0, y: -80)
    static let lift: Self = Plume.Cell.Acceleration(x: 0, y: -200)
    static let liftStrong: Self = Plume.Cell.Acceleration(x: 0, y: -500)
}

// MARK: - Drift (horizontal)

public extension Plume.Cell.Acceleration {
    static let driftLeft: Self = Plume.Cell.Acceleration(x: -50, y: 0)
    static let driftRight: Self = Plume.Cell.Acceleration(x: 50, y: 0)
}

// MARK: - Diagonal Forces

public extension Plume.Cell.Acceleration {
    static let downLeft: Self = Plume.Cell.Acceleration(x: -120, y: 300)
    static let downRight: Self = Plume.Cell.Acceleration(x: 120, y: 300)
    static let upLeft: Self = Plume.Cell.Acceleration(x: -100, y: -200)
    static let upRight: Self = Plume.Cell.Acceleration(x: 100, y: -200)
}

//
//  Acceleration+Constants.swift
//  Plume
//
//  Created by Samuel Lupton on 4/19/26.
//

// MARK: - Base

public extension Plume.Cell.Acceleration {
    /// No acceleration applied. Particles move only by initial velocity.
    static let none: Self = Plume.Cell.Acceleration(x: 0, y: 0)
}

// MARK: - Gravity (downward)

public extension Plume.Cell.Acceleration {
    /// Subtle downward pull, suitable for light drift effects.
    static let gravityLight: Self = Plume.Cell.Acceleration(x: 0, y: 100)

    /// Standard downward gravity used for most natural simulations.
    static let gravity: Self = Plume.Cell.Acceleration(x: 0, y: 300)

    /// Strong downward force for fast falling or heavy particle behavior.
    static let gravityHeavy: Self = Plume.Cell.Acceleration(x: 0, y: 800)
}

// MARK: - Lift (upward)

public extension Plume.Cell.Acceleration {
    /// Gentle upward force that slightly counteracts gravity.
    static let liftLight: Self = Plume.Cell.Acceleration(x: 0, y: -80)

    /// Noticeable upward force for buoyant or rising motion.
    static let lift: Self = Plume.Cell.Acceleration(x: 0, y: -200)

    /// Strong upward force for pronounced lift or inverse gravity effects.
    static let liftStrong: Self = Plume.Cell.Acceleration(x: 0, y: -500)
}

// MARK: - Drift (horizontal)

public extension Plume.Cell.Acceleration {
    /// Gentle leftward drift, no vertical influence.
    static let driftLeft: Self = Plume.Cell.Acceleration(x: -50, y: 0)

    /// Gentle rightward drift, no vertical influence.
    static let driftRight: Self = Plume.Cell.Acceleration(x: 50, y: 0)
}

// MARK: - Diagonal Forces

public extension Plume.Cell.Acceleration {
    /// Downward-left diagonal force combining gravity and lateral drift.
    static let downLeft: Self = Plume.Cell.Acceleration(x: -120, y: 300)

    /// Downward-right diagonal force combining gravity and lateral drift.
    static let downRight: Self = Plume.Cell.Acceleration(x: 120, y: 300)

    /// Upward-left diagonal force for rising motion with lateral drift.
    static let upLeft: Self = Plume.Cell.Acceleration(x: -100, y: -200)

    /// Upward-right diagonal force for rising motion with lateral drift.
    static let upRight: Self = Plume.Cell.Acceleration(x: 100, y: -200)
}

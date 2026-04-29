//
//  Array+Extensions.swift
//  Plume
//
//  Created by Samuel Lupton on 4/26/26.
//

import CoreGraphics

// MARK: - Plume Cell Array Factories

/// Convenience factories for building arrays of `Plume.Cell` from image collections.
extension Array where Element == Plume.Cell {

    /// Creates an array of `Plume.Cell` from a collection of `CGImage` values.
    ///
    /// This behaves identically to the `UIImage` variant, but accepts lower-level
    /// image types for greater flexibility or performance-sensitive scenarios.
    ///
    /// - Parameters:
    ///   - cgimages: The images used as the visual contents of each cell.
    ///   - lifetime: The lifetime configuration applied to all cells.
    ///   - spin: The rotational behavior applied to all cells.
    ///   - scale: The size configuration applied to all cells.
    ///   - acceleration: The acceleration applied to all cells.
    ///   - velocity: The velocity applied to all cells.
    ///   - angle: The emission angle applied to all cells.
    /// - Returns: An array of configured `Plume.Cell` instances.
    public static func make(
        from cgimages: [CGImage],
        lifetime: Plume.Cell.Lifetime,
        spin: Plume.Cell.Spin,
        scale: Plume.Cell.Scale,
        acceleration: Plume.Cell.Acceleration,
        velocity: Plume.Cell.Velocity,
        angle: Plume.Cell.Angle
    ) -> [Plume.Cell] {
        cgimages.map { cgimage in
            Plume.Cell(
                contents: Plume.Cell.Contents(cgimage: cgimage),
                lifetime: lifetime,
                spin: spin,
                scale: scale,
                acceleration: acceleration,
                velocity: velocity,
                angle: angle
            )
        }
    }

}

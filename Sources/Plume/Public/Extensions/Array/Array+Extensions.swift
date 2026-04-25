//
//  Array+Extensions.swift
//  Plume
//
//  Created by Samuel Lupton on 4/24/26.
//

import UIKit

extension Array where Element == Plume.Cell {
    public static func cells(
        uiimages: [UIImage],
        lifetime: Plume.Cell.Lifetime,
        spin: Plume.Cell.Spin,
        scale: Plume.Cell.Scale,
        acceleration: Plume.Cell.Acceleration,
        velocity: Plume.Cell.Velocity,
        angle: Plume.Cell.Angle
    ) -> [Plume.Cell] {
        return uiimages.map { uiimage in
            PlumeCell(
                contents: CellContents(uiimage: uiimage),
                lifetime: lifetime,
                spin: spin,
                scale: scale,
                acceleration: acceleration,
                velocity: velocity,
                angle: angle
            )
        }
    }
    
    public static func cells(
        cgimages: [CGImage],
        lifetime: Plume.Cell.Lifetime,
        spin: Plume.Cell.Spin,
        scale: Plume.Cell.Scale,
        acceleration: Plume.Cell.Acceleration,
        velocity: Plume.Cell.Velocity,
        angle: Plume.Cell.Angle
    ) -> [Plume.Cell] {
        return cgimages.map { cgimage in
            PlumeCell(
                contents: CellContents(cgimage: cgimage),
                lifetime: lifetime,
                spin: spin,
                scale: scale,
                acceleration: acceleration,
                velocity: velocity,
                angle: angle
            )
        }
    }
    
    @available(iOS 17.0, *)
    public static func cells(
        resources: [ImageResource],
        lifetime: Plume.Cell.Lifetime,
        spin: Plume.Cell.Spin,
        scale: Plume.Cell.Scale,
        acceleration: Plume.Cell.Acceleration,
        velocity: Plume.Cell.Velocity,
        angle: Plume.Cell.Angle
    ) -> [Plume.Cell] {
        return resources.map { resource in
            PlumeCell(
                contents: CellContents(resource: resource),
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

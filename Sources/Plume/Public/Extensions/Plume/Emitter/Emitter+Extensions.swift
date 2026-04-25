//
//  Plume+Emitter+Extensions.swift
//  PlumeAnimation
//
//  Created by Samuel Lupton on 4/22/26.
//

import CoreFoundation

public extension Plume.Emitter {
    public static func point(birthRate: CGFloat) -> Self {
        return Plume.Emitter(shape: .point, mode: .points, birthRate: birthRate)
    }
    
    public static func line(birthRate: CGFloat) -> Self {
        return Plume.Emitter(shape: .line, mode: .outline, birthRate: birthRate)
    }
    
    public static func circle(birthRate: CGFloat) -> Self {
        return Plume.Emitter(shape: .circle, mode: .surface, birthRate: birthRate)
    }
    
    public static func rectangle(birthRate: CGFloat) -> Self {
        return Plume.Emitter(shape: .rectangle, mode: .surface, birthRate: birthRate)
    }
}

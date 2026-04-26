//
//  Plume.swift
//  Plume
//
//  Created by Samuel Lupton on 4/15/26.
//

import UIKit

public struct Plume {
    public var emitter: Emitter
    public var cells: [Cell]
    
    public init(emitter: Emitter, cells: [Cell]) {
        self.emitter = emitter
        self.cells = cells
    }
}

extension Plume {
    public init(emitter: Emitter, cell template: Cell, uiimages: [UIImage]) {
        self.emitter = emitter
        self.cells = .cells(
            uiimages: uiimages,
            lifetime: template.lifetime,
            spin: template.spin,
            scale: template.scale,
            acceleration: template.acceleration,
            velocity: template.velocity,
            angle: template.angle
        )
    }
    
    public init(emitter: Emitter, cell template: Cell, cgimages: [CGImage]) {
        self.emitter = emitter
        self.cells = .cells(
            cgimages: cgimages,
            lifetime: template.lifetime,
            spin: template.spin,
            scale: template.scale,
            acceleration: template.acceleration,
            velocity: template.velocity,
            angle: template.angle
        )
    }
    
    @available(iOS 17.0, *)
    public init(emitter: Emitter, cell template: Cell, resources: [ImageResource]) {
        self.emitter = emitter
        self.cells = .cells(
            resources: resources,
            lifetime: template.lifetime,
            spin: template.spin,
            scale: template.scale,
            acceleration: template.acceleration,
            velocity: template.velocity,
            angle: template.angle
        )
    }
}

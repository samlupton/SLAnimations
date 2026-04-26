//
//  Plume.swift
//  Plume
//
//  Created by Samuel Lupton on 4/15/26.
//

import UIKit

public struct Plume {
    public var emitter: Plume.Emitter
    public var cells: [Plume.Cell]
    
    public init(emitter: Plume.Emitter, cells: [Plume.Cell]) {
        self.emitter = emitter
        self.cells = cells
    }
}

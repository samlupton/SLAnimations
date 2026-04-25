//
//  Plume+Configuration.swift
//  Plume
//
//  Created by Samuel Lupton on 4/15/26.
//

public extension Plume {
    struct Configuration: Sendable {
        public var emitter: Emitter
        public var cells: [Cell]
        
        public init(emitter: Emitter, cells: [Cell]) {
            self.emitter = emitter
            self.cells = cells
        }
    }
}

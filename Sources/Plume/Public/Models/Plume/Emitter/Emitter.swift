//
//  Plume+Emitter.swift
//  Plume
//
//  Created by Samuel Lupton on 4/20/26.
//

public extension Plume {
    struct Emitter: Sendable {
        public var shape: Plume.Emitter.Shape
        public var mode: Plume.Emitter.Mode
        
        public init(
            shape: Plume.Emitter.Shape,
            mode: Plume.Emitter.Mode
        ) {
            self.shape = shape
            self.mode = mode
        }
    }
}

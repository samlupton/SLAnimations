//
//  Plume+Emitter.swift
//  SharedPlume
//
//  Created by Samuel Lupton on 4/20/26.
//

public extension Plume {
    struct Emitter: Sendable {
        let shape: Plume.Emitter.Shape
        let mode: Plume.Emitter.Mode
        
        public init(
            shape: Plume.Emitter.Shape,
            mode: Plume.Emitter.Mode
        ) {
            self.shape = shape
            self.mode = mode
        }
    }
}

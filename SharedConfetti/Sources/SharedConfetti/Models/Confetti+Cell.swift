//
//  Confetti+Cell.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/19/26.
//

import CoreGraphics

public extension Confetti {
    struct Cell {
        let spin: Spin
        let scale: Scale
        let acceleration: Acceleration
        let velocity: Velocity
        let emission: Emission
        let contents: Contents
    }
}

public extension Confetti.Cell {
    struct Spin {
        var base: CGFloat
        var variation: CGFloat
    }
}

public extension Confetti.Cell {
    struct Scale {
        var base: CGFloat
        var variation: CGFloat
        var speed: CGFloat = 0
    }
}

public extension Confetti.Cell {
    struct Acceleration {
        var x: CGFloat
        var y: CGFloat
        var z: CGFloat
    }
}

public extension Confetti.Cell {
    struct Velocity {
        var base: CGFloat
        var variation: CGFloat
    }
}

public extension Confetti.Cell {
    struct Emission {
        var latitude: CGFloat
        var longitude: CGFloat
        var variation: CGFloat
    }
}

public extension Confetti.Cell {
    struct Contents {
        var image: CGImage?
        var rect: CGRect = .zero
        var scale: CGFloat = 1
    }
}

//
//  Confetti+Cell+Extensions.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 4/22/26.
//

internal extension Confetti.Cell {
    static func makeFountainCells(with contents: [Confetti.Cell.Contents]) -> [Self] {
        return contents.map { contents in
                .init(
                    lifetime: .init(birthRate: 100, base: 2, range: 1),
                    spin: .init(base: 0, range: 2 * .pi),
                    scale: .init(base: 0.1, range: 0.2, speed: 0),
                    acceleration: .init(x: 0, y: 200, z: 0),
                    velocity: .init(base: 200, range: 50),
                    emission: .init(longitude: -.pi / 2, range: .pi / 4),
                    contents: contents
                )
        }
    }
    
    static func makeShowerCells(with contents: [Confetti.Cell.Contents]) -> [Self] {
        return contents.map { contents in
                .init(
                    lifetime: .init(birthRate: 10, base: 2, range: 1),
                    spin: .init(base: .zero, range: 2 * .pi),
                    scale: .init(base: 0.3, range: 0.1, speed: -0.1),
                    acceleration: .init(y: 300),
                    velocity: .init(base: 100, range: 50),
                    emission: .init(longitude: .zero, range: 2 * .pi),
                    contents: contents
                )
        }
    }
    
    static func makeLeftCannonCells(with contents: [Confetti.Cell.Contents]) -> [Self] {
        return contents.map { contents in
                .init(
                    lifetime: .init(birthRate: 20, base: 5, range: 0),
                    spin: .init(base: .pi, range: .pi),
                    scale: .init(base: 0.4, range: 0.2, speed: 0),
                    acceleration: .init(x: 0, y: 200, z: 0),
                    velocity: .init(base: 300, range: 0),
                    emission: .init(latitude: 0, longitude: -.pi / 4, range: .pi / 8),
                    contents: contents
                )
        }
    }
    
    static func makeRightCannonCells(with contents: [Confetti.Cell.Contents]) -> [Self] {
        return contents.map { contents in
                .init(
                    lifetime: .init(birthRate: 20, base: 5, range: 0),
                    spin: .init(base: .pi, range: .pi),
                    scale: .init(base: 0.4, range: 0.2, speed: 0),
                    acceleration: .init(x: 0, y: 200, z: 0),
                    velocity: .init(base: 300, range: 0),
                    emission: .init(latitude: 0, longitude: -.pi + (.pi / 4), range: .pi / 8),
                    contents: contents
                )
        }
    }
}

//
//  Velocity+Extensions.swift
//  Plume
//
//  Created by Samuel Lupton on 4/25/26.
//

// MARK: - Constants

public extension Plume.Cell.Velocity {
    static let none: Self = .init(base: .zero, range: .zero)
    static let slow: Self = .init(base: 30, range: 10)
    static let `default`: Self = .init(base: 100, range: 30)
    static let fast: Self = .init(base: 200, range: 50)
    static let burst: Self = .init(base: 400, range: 100)
}

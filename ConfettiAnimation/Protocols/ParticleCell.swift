//
//  ParticleCell.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/1/25.
//

import CoreFoundation

protocol ParticleCell {
    var birthRate: Float { get }
    var lifetime: Float { get }
    var velocity: CGFloat { get }
    var emissionLongitude: CGFloat { get }
    var emissionRange: CGFloat { get }
    var spin: CGFloat { get }
    var spinRange: CGFloat { get }
    var yAcceleration: CGFloat { get }
    var scaleRange: CGFloat { get }
}

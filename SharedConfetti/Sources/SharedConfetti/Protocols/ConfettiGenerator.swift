//
//  ConfettiGenerator.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/18/26.
//

import QuartzCore
import UIKit

public protocol ConfettiGenerator {
    func makeConfetti(with cells: [CAEmitterCell]) -> CAEmitterLayer
    func makeCells(with image: [UIImage]) -> [CAEmitterCell]
    func makeAnimation() -> CABasicAnimation
}

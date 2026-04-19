//
//  ConfettiGenerator.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/18/26.
//

import QuartzCore
import UIKit

internal protocol ConfettiGenerator {
    var images: [UIImage] { get set }
    var intensity: Confetti.Intensity { get set }
    func makeConfetti(with cells: [CAEmitterCell], in rect: CGRect) -> CAEmitterLayer
    func makeCells() -> [CAEmitterCell]
    func makeAnimation() -> CABasicAnimation?
}

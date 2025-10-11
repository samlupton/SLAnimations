//
//  ContentRenderer.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/4/25.
//

import QuartzCore
import UIKit

protocol ContentRenderer {
    func makeCell(content: UIImage, with configuration: ParticleCell) -> CAEmitterCell
}

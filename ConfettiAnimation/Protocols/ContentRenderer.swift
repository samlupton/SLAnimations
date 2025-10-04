//
//  ContentRenderer.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/4/25.
//

import QuartzCore

protocol ContentRenderer {
    func makeCell(content: CGImage, with configuration: ParticleCell) -> CAEmitterCell
    func getContent() -> [CGImage]
}

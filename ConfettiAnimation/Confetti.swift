//
//  ConfettiAnimation.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 9/28/25.
//

import UIKit

class Confetti: UIView {
    
    private var cannon: Layer
    
    init(trailingCannon: Layer) {
        self.cannon = trailingCannon
        super.init(frame: .zero)
        layer.addSublayer(cannon)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cannon.frame = bounds
        cannon.configure()
    }
}

final class Layer: CAEmitterLayer {
    func configure() {
        emitterPosition = CGPoint(x: bounds.width, y: bounds.height / 2)
        frame = bounds
        birthRate = 0
        lifetime = 5
        needsDisplayOnBoundsChange = true
        emitterCells = getContent().map { content in
            makeCell(content: content, angle: 5 * .pi / 4)
        }
    }
    
    func launch() {
        beginTime = CACurrentMediaTime()
        let animation = CABasicAnimation(keyPath: #keyPath(birthRate))
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        add(animation, forKey: nil)
    }
}

extension Layer {
    func makeCell(content: CGImage, angle: Double) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 20
        cell.lifetime = 5
        cell.velocity = 200
        cell.velocityRange = cell.velocity / 2
        cell.emissionLongitude = angle
        cell.emissionRange = .pi / 8
        cell.spin = 0
        cell.spinRange = .pi
        cell.yAcceleration = 200
        cell.scaleRange = 0.75
        cell.scale = 1.0 - cell.scaleRange
        cell.contents = content
        return cell
    }
    
    func getContent() -> [CGImage] {
        return [.confetti1, .confetti2, .confetti3, .confetti4, .confetti5, .confetti6, .confetti7, .confetti8]
            .compactMap { image in
            UIImage(resource: image).cgImage
        }
    }
}

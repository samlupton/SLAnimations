//
//  ConfettiAnimation.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 9/28/25.
//

import UIKit

class Confetti: UIView {
    
    var confettiLayer: ConfettiLayer
    private var configuration: EmitterLayerConfiguration
    
    init(confettiLayer: ConfettiLayer, configuration: ConfettiConfiguration) {
        self.confettiLayer = confettiLayer
        self.configuration = configuration.model
        super.init(frame: .zero)
        layer.addSublayer(confettiLayer)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        confettiLayer.frame = bounds
        confettiLayer.configure(with: configuration)
    }
}

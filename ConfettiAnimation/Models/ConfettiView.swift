//
//  ConfettiView.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/7/25.
//

import UIKit

final class ConfettiView: UIView {
    
    private let configuration: ConfettiConfiguration
    
    init(configuration: ConfettiConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Creates and emits confetti
    func emit() {
        let confettiLayer = ConfettiLayer(configuration: configuration)
        self.layer.addSublayer(confettiLayer)
        confettiLayer.emit()
    }
}

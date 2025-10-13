//
//  ConfettiView.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/7/25.
//

import UIKit

class ConfettiView: UIView {
    
    private let configuration: ConfettiConfiguration
    
    /// Creates a instance of ConfettiView
    /// - Parameters:
    ///     - configuration: Configures the ConfettiView instance
    init(configuration: ConfettiConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Creates and emits confetti particles
    func emit() {
        let confettiLayer = ConfettiLayer(configuration: configuration.model)
        self.layer.addSublayer(confettiLayer)
        confettiLayer.emit(in: window)
    }
}

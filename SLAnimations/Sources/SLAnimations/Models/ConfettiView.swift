//
//  ConfettiView.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/7/25.
//

import UIKit

public class ConfettiView: UIView {
    
    private let configuration: EmitterLayerConfiguration
    
    /// Creates a instance of ConfettiView
    /// - Parameters:
    ///     - configuration: Configures the ConfettiView instance
    public init(configuration: EmitterLayerConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Creates and emits confetti particles
    public func emit() {
        let confettiLayer = ConfettiLayer(configuration: configuration)
        layer.addSublayer(confettiLayer)
        confettiLayer.emit(in: window)
    }
}


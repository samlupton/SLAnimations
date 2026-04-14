//
//  ConfettiViewRepresentable.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/9/25.
//

import SwiftUI

public struct ConfettiViewRepresentable: UIViewRepresentable {
    
    private let configuration: EmitterLayerConfiguration
    
    public init(configuration: EmitterLayerConfiguration) {
        self.configuration = configuration
    }

    public func makeUIView(context: Context) -> ConfettiView {
        return ConfettiView(
            configuration: configuration
        )
    }
    
    public func updateUIView(_ uiView: ConfettiView, context: Context) {}
}

//
//  ConfettiViewRepresentable.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/9/25.
//
import SwiftUI

public struct ConfettiViewRepresentable: UIViewRepresentable {
    
    let confettiView: ConfettiView
    
    public init(confettiView: ConfettiView) {
        self.confettiView = confettiView
    }
    
    public func makeUIView(context: Context) -> ConfettiView {
        confettiView
    }
    
    public func updateUIView(_ uiView: ConfettiView, context: Context) {}
}

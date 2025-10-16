//
//  ConfettiViewRepresentable.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/9/25.
//
import SwiftUI

struct ConfettiViewRepresentable: UIViewRepresentable {
    
    let confettiView: ConfettiView
    
    init(confettiView: ConfettiView) {
        self.confettiView = confettiView
    }
    
    func makeUIView(context: Context) -> ConfettiView {
        confettiView
    }
    
    func updateUIView(_ uiView: ConfettiView, context: Context) {}
}

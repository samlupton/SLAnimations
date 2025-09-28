//
//  ViewAdaptor.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 9/25/25.
//


import SwiftUI

struct ViewAdaptor: UIViewRepresentable {
    
    let view: UIView
    
    init(_ view: UIView) {
        self.view = view
    }

    func makeUIView(context: Context) -> UIView {
        view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

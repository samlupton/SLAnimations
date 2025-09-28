//
//  ViewAdaptor.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 9/25/25.
//


import SwiftUI

struct ViewAdaptor: UIViewControllerRepresentable {
    
    let viewController: UIViewController
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }

    func makeUIViewController(context: Context) -> UIViewController {
        viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
//
//  ContentView.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 9/25/25.
//

import SwiftUI
import FJComponents

struct ContentView: View {
    let confettiCannonView = ConfettiView(configuration: .cannon)
    let confettiShowerView = ConfettiView(configuration: .shower)
    let rocketView = ConfettiView(configuration: .rocket)
    
    var body: some View {
        Spacer()
        Button {
            Task {
                let impactEngine = UIImpactFeedbackGenerator(style: .heavy)
                impactEngine.impactOccurred()
                emitConfetti(with: confettiCannonView)
            }
        } label: {
            Text("Activate Confetti Cannon")
                .padding()
        }
        .buttonStyle(.bordered)
        
        Button {
            let impactEngine = UIImpactFeedbackGenerator(style: .heavy)
            impactEngine.impactOccurred()
            emitConfetti(with: confettiShowerView)
        } label: {
            Text("Activate Confetti Shower")
                .padding()
        }
        .buttonStyle(.bordered)
        
        Button {
            let impactEngine = UIImpactFeedbackGenerator(style: .heavy)
            impactEngine.impactOccurred()
            emitConfetti(with: rocketView)
        } label: {
            Text("Activate RocketView")
                .padding()
        }
        .buttonStyle(.bordered)
    }
}


func getTopWindow() -> UIWindow? {
    let windowScene = UIApplication
        .shared
        .connectedScenes
        .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene
    let window = windowScene?.keyWindow
    return window
}

func emitConfetti(with confettiView: ConfettiView = ConfettiView(configuration: .cannon)) {
    guard let window = getTopWindow() else {
        return
    }
    window.rootViewController?.view.superview?.addSubview(confettiView)
    confettiView.emit()
}

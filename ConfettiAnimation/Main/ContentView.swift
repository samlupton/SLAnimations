//
//  ContentView.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 9/25/25.
//

import SwiftUI

struct ContentView: View {
    let rightConfettiCannonView = ConfettiView(configuration: .rightCannon)
    let leftConfettiCannonView = ConfettiView(configuration: .leftCannon)
    let confettiShowerView = ConfettiView(configuration: .shower)
    let rocketView = ConfettiView(configuration: .rocket)
    
    var body: some View {
        Spacer()
        Button {
            Task {
                let impactEngine = UIImpactFeedbackGenerator(style: .heavy)
                impactEngine.impactOccurred()
                emitConfetti(with: rightConfettiCannonView)
                try? await Task.sleep(nanoseconds: 500_000_000)
                emitConfetti(with: leftConfettiCannonView)
            }
        } label: {
            Text("Activate Confetti Cannon")
        }
        .buttonStyle(.bordered)
        
        Button {
            let impactEngine = UIImpactFeedbackGenerator(style: .heavy)
            impactEngine.impactOccurred()
            emitConfetti(with: confettiShowerView)
        } label: {
            Text("Activate Confetti Shower")
        }
        .buttonStyle(.bordered)
        
        Button {
            let impactEngine = UIImpactFeedbackGenerator(style: .heavy)
            impactEngine.impactOccurred()
            emitConfetti(with: rocketView)
        } label: {
            Text("Activate RocketView")
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

func emitConfetti(with confettiView: ConfettiView) {
    guard let window = getTopWindow() else {
        return
    }
    window.rootViewController?.view.superview?.addSubview(confettiView)
    confettiView.emit()
}

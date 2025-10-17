//
//  ContentView.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 9/25/25.
//

import SwiftUI
import SLAnimations

struct ContentView: View {
    let rightConfettiCannonView = ConfettiView(configuration: .rightCannon)
    let leftConfettiCannonView = ConfettiView(configuration: .leftCannon)
    let confettiShowerView = ConfettiView(configuration: .shower)
    let rocketView = ConfettiView(configuration: .rocket)
    let starsView = ConfettiView(configuration: .stars)
    let snowView = ConfettiView(configuration: .snow)
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
            emitConfetti(with: starsView)
        } label: {
            Text("Activate Stary Night")
        }
        .buttonStyle(.bordered)
        
        Button {
            let impactEngine = UIImpactFeedbackGenerator(style: .heavy)
            impactEngine.impactOccurred()
            emitConfetti(with: snowView)
        } label: {
            Text("Activate Snowy Night")
        }
        .buttonStyle(.bordered)
//        Button {
//            let impactEngine = UIImpactFeedbackGenerator(style: .heavy)
//            impactEngine.impactOccurred()
//            emitConfetti(with: starsView)
//        } label: {
//            Text("Activate Stars View")
//        }
//        .buttonStyle(.bordered)
    }
}

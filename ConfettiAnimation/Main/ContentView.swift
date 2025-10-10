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
    
    var body: some View {
        ConfettiViewRepresentable(confettiView: confettiCannonView)
        ConfettiViewRepresentable(confettiView: confettiShowerView)
        Spacer()
        Button {
            Task {
                let impactEngine = UIImpactFeedbackGenerator(style: .heavy)
                impactEngine.impactOccurred()
                confettiCannonView.emit()
                
            }
        } label: {
            Text("Activate Confetti Cannon")
                .padding()
        }
        .buttonStyle(.bordered)
        
        Button {
            let impactEngine = UIImpactFeedbackGenerator(style: .heavy)
            impactEngine.impactOccurred()
            confettiShowerView.emit()
        } label: {
            Text("Activate Confetti Shower")
                .padding()
        }
        .buttonStyle(.bordered)
    }
}


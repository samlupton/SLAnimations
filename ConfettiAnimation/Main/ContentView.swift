//
//  ContentView.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 9/25/25.
//

import SwiftUI
import FJComponents

struct ContentView: View {
    var body: some View {
        Button {
            UIApplication.shared.emitConfetti()
        } label: {
            Text("Activate Confetti Cannon")
        }
        
        Button {
            UIApplication.shared.emitConfetti(configuration: .shower)
        } label: {
            Text("Activate Confetti Shower")
        }
    }
}

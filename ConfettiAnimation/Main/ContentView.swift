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
            emitConfetti(configuration: .cannon)
        } label: {
            Text("Activate Confetti Cannon")
        }
        Button {
            emitConfetti(configuration: .shower)
        } label: {
            Text("Activate Confetti Shower 2")
        }
    }
}

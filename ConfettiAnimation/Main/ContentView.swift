//
//  ContentView.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 9/25/25.
//

import SwiftUI
import FJComponents

struct ContentView: View {
    @State private var logs: [String] = []
    @State private var count = 0
    let cannonLayer = ConfettiLayer(configuration: ConfettiCannons())
    let showerLayer = ConfettiLayer(configuration: ConfettiShower())
    
    var body: some View {
        Spacer()
        ScrollView {
            ForEach(logs, id: \.self) { log in
                Text(log)
            }
        }
        Button {
            emitConfetti(layer: cannonLayer)
            count += 1
            logs.append("\(count). cannon")
        } label: {
            Text("Activate Confetti Cannon")
                .padding()
        }
        .buttonStyle(.bordered)
        Button {
            emitConfetti(layer: showerLayer)
            count += 1
            logs.append("\(count). shower")
        } label: {
            Text("Activate Confetti Shower")
                .padding()
        }
        .buttonStyle(.bordered)
    }
}

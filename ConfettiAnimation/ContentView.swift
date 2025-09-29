//
//  ContentView.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 9/25/25.
//

import SwiftUI

struct ContentView: View {
    
    let l1 = Layer()
    let l2 = Layer()
    
    var body: some View {
        Button {
            l2.launch()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                l1.launch()
            }
        } label: {
            Text("Press me")
        }

        ViewAdaptor(Confetti(trailingCannon: l1))
            .overlay {
                ViewAdaptor(Confetti(trailingCannon: l2))
                    .scaleEffect(x: -1, y: 1)
            }
    }
}

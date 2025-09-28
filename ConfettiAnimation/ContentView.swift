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
            l1.launch()
        } label: {
            Text("Press me")
        }
        .onTapGesture {
            print("l1.birthRate = \(l1.birthRate)")
            print("l2.birthRate = \(l2.birthRate)")
        }
        .onChange(of: l2.birthRate) { oldValue, newValue in
            print("l2.birthRate = \(l2.birthRate)")
        }
        .onChange(of: l1.birthRate) { oldValue, newValue in
            print("l1.birthRate = \(l1.birthRate)")
        }

        ViewAdaptor(Confetti(trailingCannon: l1))
            .overlay {
                ViewAdaptor(Confetti(trailingCannon: l2))
                    .scaleEffect(x: -1, y: 1)
            }
    }
}



#Preview {
    ContentView()
}

//
//  ConfettiViewModel.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/15/26.
//

import Foundation

@MainActor
open class ConfettiViewModel: ObservableObject {
    public var configuration: Confetti

    public init(configuration: Confetti) {
        self.configuration = configuration
    }

    open func emit() {
        
    }
}

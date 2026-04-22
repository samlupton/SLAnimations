//
//  ConfettiEmitterDelegate.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/21/26.
//

import ObjectiveC

@MainActor internal protocol ConfettiEmitterDelegate: NSObject {
    func emit()
}

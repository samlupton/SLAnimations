//
//  ConfettiEmitterDelegate.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/21/26.
//

import ObjectiveC

@MainActor public protocol ConfettiEmitterDelegate: NSObject {
    func emit()
}

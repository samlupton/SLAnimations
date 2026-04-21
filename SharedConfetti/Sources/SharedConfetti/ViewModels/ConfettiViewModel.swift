//
//  ConfettiViewModel.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/21/26.
//

public final class ConfettiViewModel {
    internal weak var delegate: ConfettiEmitterDelegate?
    
    public init() {}
    
    public func emit() {
        delegate?.emit()
    }
}

//
//  ConfettiViewModel.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/21/26.
//

public class ConfettiViewModel {
    public weak var delegate: ConfettiEmitterDelegate?
    
    public init() {}
    
    open func emit() {
        delegate?.emit()
    }
}

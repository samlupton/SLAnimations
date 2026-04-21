//
//  ConfettiViewModel.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/21/26.
//

public final class ConfettiViewModel {
    internal weak var delegate: ConfettiEmitterDelegate?
    internal var styles: [Confetti.Style]
    
    public init(style: Confetti.Style) {
        self.styles = [style]
    }

    public init(styles: [Confetti.Style]) {
        self.styles = styles
    }

    public func emit() {
        delegate?.emit()
    }
}

//
//  ConfettiView.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 9/28/25.
//

import UIKit

class ConfettiView: UIView {
    required init(confettiLayer: ConfettiLayer) {
        super.init(frame: .zero)
        layer.addSublayer(confettiLayer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  Assets.swift
//  SharedConfetti
//
//  Created by Samuel Lupton on 4/19/26.
//

import UIKit

extension Confetti {
    internal enum Assets: Sendable {
        static func makeShower() -> [CGImage] {
            return [
                UIImage(resource: .i1),
                UIImage(resource: .i2),
                UIImage(resource: .i3),
                UIImage(resource: .i4),
                UIImage(resource: .i5),
                UIImage(resource: .i6),
                UIImage(resource: .i7),
                UIImage(resource: .i8)
            ].compactMap { $0.cgImage }
        }
        
        static func makeFountain() -> [CGImage] {
            return [
                UIImage(resource: .water1),
                UIImage(resource: .water2),
                UIImage(resource: .water3),
                UIImage(resource: .water4)
            ].compactMap { $0.cgImage }
        }
    }
}

//
//  ConfettiModels.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/1/25.
//

enum ConfettiConfiguration {
    case rightCannon
    case leftCannon
    case shower
    case rocket
    
    var model: EmitterLayerConfiguration {
        switch self {
        case .rightCannon:
            RightConfettiCannons()
        case .leftCannon:
            LeftConfettiCannons()
        case .shower:
            ConfettiShower()
        case .rocket:
            RocketPropulsion()
        }
    }
}

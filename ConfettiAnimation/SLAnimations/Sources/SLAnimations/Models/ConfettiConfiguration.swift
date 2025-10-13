//
//  ConfettiModels.swift
//  ConfettiAnimation
//
//  Created by Samuel Lupton on 10/1/25.
//

@MainActor
public enum ConfettiConfiguration {
    case rightCannon
    case leftCannon
    case shower
    case rocket
    
    public var model: EmitterLayerConfiguration {
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

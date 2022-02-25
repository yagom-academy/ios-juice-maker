//
//  Juice.swift
//  JuiceMaker
//
//  Created by Doogie & Malrang.
//
enum Menu {
    case strawBerryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case ddalBaJuice
    case mangoJuice
    case mangKiJuice
    var recipie: [Fruits : Int] {
        get {
            switch self {
            case .strawBerryJuice:
                return [.strawberry : 16]
            case .bananaJuice:
                return [.banana : 2]
            case .kiwiJuice:
                return [.kiwi : 3]
            case .pineappleJuice:
                return [.pineapple : 2]
            case .ddalBaJuice:
                return [.strawberry : 10, .banana : 1]
            case .mangoJuice:
                return [.mango : 3]
            case .mangKiJuice:
                return [.mango : 2, .kiwi : 1]
            }
        }
    }
}

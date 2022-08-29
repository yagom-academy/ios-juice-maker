//
//  Fruit.swift
//  JuiceMaker
//
//  Created by Kyo, TaeLee on 2022/08/29.
//

enum Juice {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
    
    struct fruitType {
        let first: Int
        let second: Int
    }
    
    var usageFruit: fruitType {
        switch self {
        case .strawberryJuice:
            return fruitType(first: 16, second: 0)
        case .bananaJuice:
            return fruitType(first: 2, second: 0)
        case .pineappleJuice:
            return fruitType(first: 2, second: 0)
        case .kiwiJuice:
            return fruitType(first: 3, second: 0)
        case .mangoJuice:
            return fruitType(first: 3, second: 0)
        case .strawberryBananaJuice:
            return fruitType(first: 10, second: 1)
        case .mangoKiwiJuice:
            return fruitType(first: 2, second: 2)
        }
    }
}

//
//  JuiceMakerEnum.swift
//  JuiceMaker
//
//  Created by JeongTaek Han on 2021/10/28.
//

import Foundation

enum Fruits: String, CaseIterable {
    case strawberry = "strawberry"
    case banana = "banana"
    case pineapple = "pineapple"
    case kiwi = "kiwi"
    case mango = "mango"
    
    static func findFruit(by fruitID: String) -> Fruits? {
        if fruitID.hasPrefix("strawberry") {
            return .strawberry
        } else if fruitID.hasPrefix("banana") {
            return .banana
        } else if fruitID.hasPrefix("pineapple") {
            return .pineapple
        } else if fruitID.hasPrefix("kiwi") {
            return .kiwi
        } else if fruitID.hasPrefix("mango") {
            return .mango
        }
        return nil
    }
}

enum Juice: CaseIterable, CustomStringConvertible {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case kiwiMangoJuice
    
    static func findJuice(juiceID: String) -> Juice? {
        if juiceID.hasPrefix("strawberryJuice") {
            return .strawberryJuice
        } else if juiceID.hasPrefix("bananaJuice") {
            return .bananaJuice
        } else if juiceID.hasPrefix("kiwiJuice") {
            return .kiwiJuice
        } else if juiceID.hasPrefix("pineappleJuice") {
            return .pineappleJuice
        } else if juiceID.hasPrefix("strawberryBananaJuice") {
            return .strawberryBananaJuice
        } else if juiceID.hasPrefix("mangoJuice") {
            return .mangoJuice
        } else if juiceID.hasPrefix("kiwiMangoJuice") {
            return .kiwiMangoJuice
        }
        return nil
    }
    
    var recipe: [Fruits: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .strawberryBananaJuice:
            return [.strawberry: 10, .banana: 1]
        case .mangoJuice:
            return [.mango: 3]
        case .kiwiMangoJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
    
    var description: String {
        switch self {
        case .strawberryJuice:
            return "딸기 주스"
        case .bananaJuice:
            return "바나나 주스"
        case .kiwiJuice:
            return "키위 주스"
        case .pineappleJuice:
            return "파인애플 주스"
        case .strawberryBananaJuice:
            return "딸기바나나 주스"
        case .mangoJuice:
            return "망고 주스"
        case .kiwiMangoJuice:
            return "키위망고 주스"
        }
    }
}

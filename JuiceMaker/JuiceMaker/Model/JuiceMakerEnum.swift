//
//  JuiceMakerEnum.swift
//  JuiceMaker
//
//  Created by JeongTaek Han on 2021/10/28.
//

import Foundation
import UIKit

enum Fruits: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    
    var descriptionEN: String {
        return String(describing: self)
    }
    
    func isSameKind(with fruitID: String?) -> Bool {
        guard let fruitID = fruitID else {
            return false
        }
        return self.descriptionEN == fruitID
    }
    
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

enum Juice: CaseIterable {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case kiwiMangoJuice
    
    static func findJuice(juiceID: String) -> Juice? {
        switch juiceID {
        case "strawberryJuice":
            return .strawberryJuice
        case "bananaJuice":
            return .bananaJuice
        case "kiwiJuice":
            return .kiwiJuice
        case "pineappleJuice":
            return .pineappleJuice
        case "strawberryBananaJuice":
            return .strawberryBananaJuice
        case "mangoJuice":
            return .mangoJuice
        case "kiwiMangoJuice":
            return .kiwiMangoJuice
        default:
            return nil
        }
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

    var descriptionEN: String {
        return String(describing: self)
    }
    
    var descriptionKR: String {
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

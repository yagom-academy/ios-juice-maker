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
    
    var description: String {
        return String(describing: self)
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
        return String(describing: self)
    }
    
    var translatedDescription: String {
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

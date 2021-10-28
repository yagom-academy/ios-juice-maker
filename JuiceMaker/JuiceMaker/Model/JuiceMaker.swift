//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
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
        
        var recipe: [FruitStore.Fruits: Int] {
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
    
    private let fruitStorage: FruitStore
    
    init(fruitStorage: FruitStore) {
        self.fruitStorage = fruitStorage
    }
    
    func order(juice: Juice) -> Juice? {
        return canMake(juice: juice) ? make(juice: juice) : nil
    }
    
    private func canMake(juice: Juice) -> Bool {
        for (fruit, count) in juice.recipe {
            if fruitStorage.hasStock(of: fruit, count: count) == false {
                return false
            }
        }
        return true
    }
    
    private func make(juice: Juice) -> Juice {
        juice.recipe.forEach { fruitStorage.subtract(fruit: $0, of: $1) }
        return juice
    }
}

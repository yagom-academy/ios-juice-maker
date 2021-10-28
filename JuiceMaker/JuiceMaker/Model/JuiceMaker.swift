//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    enum Juice: Equatable, CaseIterable {
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

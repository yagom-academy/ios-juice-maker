//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    enum JuiceMenu {
        case strawberry, banana, kiwi, pineapple, mango, strawberryBanana, mangoKiwi
        
        fileprivate var recipe: [FruitStore.Fruit: Int] {
            switch self {
            case .strawberry:
                return [.strawberry: 16]
            case .banana:
                return [.banana: 2]
            case.kiwi:
                return [.kiwi: 3]
            case .pineapple:
                return [.pineapple: 2]
            case .mango:
                return [.mango: 3]
            case .strawberryBanana:
                return [.strawberry: 10, .banana: 1]
            case .mangoKiwi:
                return [.mango: 2, .kiwi: 1]
            }
        }
    }
    
    private let fruitStore = FruitStore()
    
    func makeJuice(menu: JuiceMenu) throws {
        for (fruit, quantity) in menu.recipe {
            try fruitStore.changeFruitStock(of: fruit, by: quantity, calculate: -)
        }
    }
}

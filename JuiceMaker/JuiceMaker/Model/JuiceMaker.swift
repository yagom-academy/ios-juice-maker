//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입 
struct JuiceMaker {
    let warehouse: FruitStore
    
    func produce(kindOf menuName: JuiceMenu) {
        let recipe = menuName.menuRecipe()
    }
    
    enum JuiceMenu {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
        case strawberryBanana
        case mangoKiwi
        
        func menuRecipe() -> [(requiredCrop: Fruit, requestedAmount: Int)] {
            var recipe: [(Fruit, Int)]
            
            switch self {
            case .strawberry:
                recipe = [(Fruit.strawberry, 16)]
            case .banana:
                recipe = [(Fruit.banana, 2)]
            case .kiwi:
                recipe = [(Fruit.kiwi, 3)]
            case .pineapple:
                recipe = [(Fruit.pineapple, 2)]
            case .mango:
                recipe = [(Fruit.mango, 3)]
            case .strawberryBanana:
                recipe = [(Fruit.strawberry, 10),(Fruit.banana, 1)]
            case .mangoKiwi:
                recipe = [(Fruit.mango, 2), (Fruit.kiwi, 1)]
            }
            return recipe
        }
        
    }
}

//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

enum Fruit {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

class FruitStore {
    private var fruitStocks: [Fruit : Int] = [.strawberry : 10,
                                             .banana : 10,
                                             .pineapple : 10,
                                             .kiwi : 10,
                                             .mango : 10]
    
    func verifyFruitCount(_ fruit: Fruit, count: Int) -> Bool {
        guard let stock = fruitStocks[fruit] else {
            return false
        }
        
        return stock >= count ? true : false
    }
    
    func changeFruitCount(_ fruit: Fruit, count: Int, isUseFruit: Bool = true) {
        guard let stock = fruitStocks[fruit] else {
            return
        }
        
        let fruitAmount = isUseFruit ? (count * -1) : count
        
        fruitStocks[fruit] = stock + fruitAmount
    }
}

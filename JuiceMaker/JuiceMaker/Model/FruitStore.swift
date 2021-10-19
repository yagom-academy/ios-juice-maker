//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    var fruitQuantity: Dictionary<Fruit, Int> = Dictionary(uniqueKeysWithValues: zip(Fruit.allCases,
                                                                                     Array(repeating: 10, count: Fruit.allCases.count)))
        
    func changeQuantity(of fruit: Fruit, quantity: Int) {
        fruitQuantity[fruit] = quantity
    }
}

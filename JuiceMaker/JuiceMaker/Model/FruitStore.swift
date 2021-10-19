//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


extension Dictionary {
    init<T>(uniqueKeys: T, repeating: Int) where T: Collection, T.Element == Key, Int == Value {
        self = Dictionary(uniqueKeysWithValues: zip(uniqueKeys, Array(repeating: repeating, count: uniqueKeys.count)))
    }
}

enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

class FruitStore {
    var fruitQuantity: Dictionary<Fruit, Int> = Dictionary(uniqueKeys: Fruit.allCases, repeating: 10)
        
    func changeQuantity(of fruit: Fruit, count: Int, by operation: (Int, Int) -> Int) {
        guard let stock = fruitQuantity[fruit] else {
            return
        }
        fruitQuantity[fruit] = operation(stock, count)
    }
}

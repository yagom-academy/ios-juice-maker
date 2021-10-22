//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private(set) var fruitQuantity: Dictionary<Fruit, Int> = Dictionary(uniqueKeys: Fruit.allCases, repeating: 10)
    
    enum Operation {
        case addition
        case subtraction
    }
    
    func changeQuantity(of fruit: Fruit, count: Int, by: Operation) {
        guard let stock = fruitQuantity[fruit] else {
            return
        }
        
        let operation: ((Int, Int) -> Int)
        
        switch by {
        case .addition:
            operation = { $0 + $1 }
        case .subtraction:
            operation = { $0 - $1 }
        }
        
        fruitQuantity[fruit] = operation(stock, count)
    }
    
    func isRemaining(of recipe: [Fruit : Int]) -> Bool {
        for (fruit, count) in recipe {
            
            guard let fruitQuantity = fruitQuantity[fruit], fruitQuantity >= count else {
                return false
            }
        }
        return true
    }
}

extension Dictionary {
    init<T>(uniqueKeys: T, repeating value: Value) where T: Collection, T.Element == Key {
        self = Dictionary(uniqueKeysWithValues: zip(uniqueKeys, Array(repeating: value, count: uniqueKeys.count)))
    }
}

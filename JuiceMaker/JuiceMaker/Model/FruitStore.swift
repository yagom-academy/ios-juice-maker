//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

final class FruitStore {
    static var shared = FruitStore()
    
    private var fruitBox: [Fruit: Int] = [:]

    private init() {
        self.fruitBox = [
            .strawberry: 10,
            .banana: 10,
            .pineapple: 10,
            .kiwi: 10,
            .mango: 10
        ]
    }
    
    func getQuantity(of fruit: Fruit) throws -> Int {
        guard let numberOfFruit = fruitBox[fruit] else {
            throw FruitStoreError.fruitNotFound
        }
        
        return numberOfFruit
    }
    
    func setQuantity(of fruit: Fruit, to quantity: Int) {
        fruitBox[fruit] = quantity
    }
    
    func subtractFruit(_ fruit: Fruit, quantity: Int) throws {
        fruitBox[fruit] = try getQuantity(of: fruit) - quantity
    }
    
    func verifySingleFruitExistsEnough(fruit: Fruit, quantity: Int) throws {
        if try getQuantity(of: fruit) < quantity {
            throw FruitStoreError.insufficientFruits
        }
    }
}

//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private(set) var fruitStock: [Fruit : Int] = [:]
    
    init(defaultStock: Int = 10) {
        for fruit in Fruit.allCases {
            fruitStock.updateValue(defaultStock, forKey: fruit)
        }
    }
    
    func bringFruitStock(_ fruit: Fruit) throws -> Int {
        guard let fruitAmount = fruitStock[fruit] else {
            throw JuiceMakerError.invalidFruit
        }
        return fruitAmount
    }
    
    func addFruits(fruit: Fruit, amount: Int) {
        var fruitAmount = bringValidFruitStock(fruit)
        
        fruitAmount += amount
        fruitStock[fruit] = fruitAmount
    }
    
    func substractFruits(juice: Juice) {
        for fruit in juice.recipe {
            var fruitAmount = bringValidFruitStock(fruit.name)
            
            fruitAmount -= fruit.count
            fruitStock[fruit.name] = fruitAmount
        }
    }
    
    func bringValidFruitStock(_ fruit: Fruit) -> Int {
        do {
            let fruitAmount = try bringFruitStock(fruit)
            return fruitAmount
        } catch JuiceMakerError.invalidFruit {
            print("없는 과일입니다.")
        } catch {
            print("some error")
        }
        
        return ConstantUsageFruit.invalidFruit
    }
}

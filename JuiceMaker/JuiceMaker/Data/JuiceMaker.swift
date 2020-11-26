//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class JuiceMaker {
    static let shared = JuiceMaker()
    private init() {}
    
    private let recipe = JuiceRecipe()
    
    private var fruits: [FruitsType : Fruit] = [
        .strawberry : Fruit(fruitType: .strawberry),
        .banana : Fruit(fruitType: .banana),
        .pineapple : Fruit(fruitType: .pineapple),
        .kiwi : Fruit(fruitType: .kiwi),
        .mango : Fruit(fruitType: .mango)
    ]
    
    func getFruits() -> [FruitsType : Fruit] {
        return fruits
    }
    
    func getJuices() -> [Juices] {
        return recipe.juices
    }
    
    func setStock(fruitType: FruitsType, stock: Int) throws {
        guard let fruit = fruits[fruitType] else {
            throw JuiceMakerError.setStock
        }
        
        fruit.setStock(stock)
    }
    
    func choiceJuice(juice: Juices) throws {
        let juiceRecipe = recipe.getJuiceRecipe(juice)
        
        for (key: fruit, value: stock) in juiceRecipe {
            guard let fruit = fruits[fruit] else {
                throw JuiceMakerError.notFound
            }
            
            guard fruit.canMakeJuice(need: stock) else {
                throw JuiceMakerError.outOfStock
            }
        }
        
        for (key: fruit, value: stock) in juiceRecipe {
            try makeJuice(fruitType: fruit, use: stock)
        }
    }
    
    func makeJuice(fruitType: FruitsType, use: Int) throws {
        
        guard let fruit = fruits[fruitType] else {
            throw JuiceMakerError.notFound
        }
        
        fruit.useStock(use)
    }
}

//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore = FruitStore()) {
        self.fruitStore = fruitStore
    }
    
    func makeJuice(juice: Juice) throws {
        try self.fruitStore.useValidStock(juiceRecipe: juice.recipe)
    }
    
    func getStock(fruit: Fruit) -> Int {
        return fruitStore.getStock(fruit: fruit)
    }
}

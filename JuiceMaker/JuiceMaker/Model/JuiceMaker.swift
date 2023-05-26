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
    
    func getAllStock() -> [Fruit: Int] {
        return self.fruitStore.getAllStock()
    }
    
    func getStock(fruit: Fruit) -> Int {
        return self.fruitStore.getStock(fruit: fruit)
    }
    
    func updateStock(to newStock: [Fruit: Int]) {
        self.fruitStore.updateStock(to: newStock)
    }
}

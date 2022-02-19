//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker: MakerType {

    typealias Recipe = [Material]
    
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func makeDrink(_ drink: Drinkable) throws -> Drinkable {
        let recipe: Recipe = drink.recipe
        
        guard self.isAvailable(recipe: recipe) else {
            throw JuiceMakerError.outOfStock
        }
        
        for material in recipe {
            try self.fruitStore.decrease(fruit: material.fruit, to: material.count)
        }
        return drink
    }
    
    private func isAvailable(recipe: Recipe) -> Bool {
        return recipe
            .map { self.fruitStore.hasStock(of: $0.fruit, to: $0.count) }
            .allSatisfy { $0 == true }
    }
}

//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
	enum Fruit: CaseIterable {
		case strawberry
		case banana
		case pineapple
		case kiwi
		case mango
	}
	
	private var inventory: Dictionary<Fruit, Int> = Fruit.allCases.reduce(into: Dictionary<Fruit, Int>()) { $0[$1] = 10 }
	
    func checkStock(_ recipes: Array<Recipe>) throws -> Array<Recipe> {
		var chagedStock: Array<Recipe> = []
		for recipe in recipes {
			guard let fruitStock = inventory[recipe.fruit] else { throw StockError.fruitNotFound }
            guard fruitStock > recipe.amount else { throw StockError.outOfStock }
			chagedStock.append((fruit: recipe.fruit, amount: fruitStock - recipe.amount))
		}
        return chagedStock
    }
    
	func changeStock(of fruit: Fruit, quantity: Int) {
        guard let _ = inventory[fruit] else { return }
		
		inventory[fruit] = quantity
	}
}

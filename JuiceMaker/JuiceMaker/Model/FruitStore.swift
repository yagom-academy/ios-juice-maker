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
	
    func isEnoughStock(_ recipes: Array<Recipe>) -> Bool {
		for recipe in recipes {
			guard let fruitStock = inventory[recipe.fruit] else { return false }
			guard fruitStock > recipe.amount else { return false }
		}
        return true
    }
    
	func changeStock(of fruit: Fruit, minus amount: Int) {
		guard let fruitStock = inventory[fruit] else { return }
		guard fruitStock > amount else { return }
		
		inventory[fruit] = fruitStock - amount
	}
}

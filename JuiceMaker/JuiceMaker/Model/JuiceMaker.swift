//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


enum Recipe: String {
	case strawberryJuice = "딸기쥬스"
	case bananaJuice = "바나나쥬스"
	case kiwiJuice = "키위쥬스"
	case pineappleJuice = "파인애플쥬스"
	case ddalbaJuice = "딸바쥬스"
	case mangoJuice = "망고쥬스"
	case mangoKiwiJuice = "망고키위쥬스"
	
	var requiredIngredients: [Fruit: UInt] {
		switch self {
		case .strawberryJuice:
			return [Fruit.strawberry: 16]
		
		case .bananaJuice:
			return [Fruit.banana: 2]
		
		case .kiwiJuice:
			return [Fruit.kiwi: 3]
			
		case .pineappleJuice:
			return [Fruit.pineapple: 2]
			
		case .ddalbaJuice:
			return [Fruit.strawberry: 10, Fruit.banana: 1]
			
		case .mangoJuice:
			return [Fruit.mango: 3]
			
		case .mangoKiwiJuice:
			return [Fruit.mango: 2, Fruit.kiwi: 1]
		}
	}
}

// 쥬스 메이커 타입 
struct JuiceMaker {
    let connectedStore = FruitStore.fruitStore

	func canMakeJuice(recipe: Recipe) -> Bool {
		for (fruit, amount) in recipe.requiredIngredients {
			guard connectedStore.hasEnoughFruitsStock(fruit: fruit, number: amount) else {
				return false
			}
		}
		for (fruit, amount) in recipe.requiredIngredients {
			_ = connectedStore.consume(fruit: fruit, number: amount)
		}
        return true
	}
	
}





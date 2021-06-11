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
			return [.strawberry: 16]
		
		case .bananaJuice:
			return [.banana: 2]
		
		case .kiwiJuice:
			return [.kiwi: 3]
			
		case .pineappleJuice:
			return [.pineapple: 2]
			
		case .ddalbaJuice:
			return [.strawberry: 10, .banana: 1]
			
		case .mangoJuice:
			return [.mango: 3]
			
		case .mangoKiwiJuice:
			return [.mango: 2, .kiwi: 1]
		}
	}
}

// 쥬스 메이커 타입 
struct JuiceMaker {
    let fruitStore = FruitStore.fruitStore

	func canMakeJuice(recipe: Recipe) -> Bool {
		for (fruit, amount) in recipe.requiredIngredients {
			guard fruitStore.hasEnoughFruitsStock(fruit: fruit, number: amount) else {
				return false
			}
		}
		for (fruit, amount) in recipe.requiredIngredients {
			_ = fruitStore.consume(fruit: fruit, number: amount)
		}
        return true
	}
	
}





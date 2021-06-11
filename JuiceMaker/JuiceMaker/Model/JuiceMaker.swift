//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


enum Recipe {
	
	case strawberryJuice
	case bananaJuice
	case kiwiJuice
	case pineappleJuice
	case ddalbaJuice
	case mangoJuice
	case mangoKiwiJuice
	
	var requiredIngredients: [Fruit: Int] {
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
    
	func makeJuice(recipe: Recipe) {
		for (fruit, amount) in recipe.requiredIngredients {
			guard connectedStore.hasEnoughFruitsStock(fruit: fruit, number: amount) else {
                
				return
			}
		}
		for (fruit, amount) in recipe.requiredIngredients {
			connectedStore.consume(fruit: fruit, number: amount)
		}
	}
	
}





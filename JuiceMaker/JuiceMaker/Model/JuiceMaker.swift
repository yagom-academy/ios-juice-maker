//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


enum Recipe {
	
	case strawberryJuiceRecipe
	case bananaJuiceRecipe
	case kiwiJuiceRecipe
	case pineappleJuiceRecipe
	case ddalbaJuiceRecipe
	case mangoJuiceRecipe
	case mangoKiwiJuiceRecipe
	
	var ingredients: [[Fruit: Int]] {
		switch self {
		case .strawberryJuiceRecipe:
			return [[Fruit.strawberry: 16]]
		
		case .bananaJuiceRecipe:
			return [[Fruit.banana: 2]]
		
		case .kiwiJuiceRecipe:
			return [[Fruit.kiwi: 3]]
			
		case .pineappleJuiceRecipe:
			return [[Fruit.pineapple: 2]]
			
		case .ddalbaJuiceRecipe:
			return [[Fruit.strawberry: 10], [Fruit.banana: 1]]
			
		case .mangoJuiceRecipe:
			return [[Fruit.mango: 3]]
			
		case .mangoKiwiJuiceRecipe:
			return [[Fruit.mango: 2], [Fruit.kiwi: 1]]
		}
	}
}

// 쥬스 메이커 타입 
struct JuiceMaker {
	
	let connectedStore = FruitStore.fruitStore
    
	func makeJuice(recipe: Recipe) {
		for ingredient in recipe.ingredients {
			for (fruit, amount) in ingredient {
				guard connectedStore.hasEnoughFruitsStock(fruit: fruit, number: amount) else {
					return
				}
				connectedStore.consume(fruit: fruit, number: amount)
			}
		}
	}
   
    
}




